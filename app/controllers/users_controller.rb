class UsersController < ApplicationController
    before_action :set_user, only: [:edit, :update, :show]
    before_action :require_same_user, only: [:edit, :update, :show, :destroy]
    before_action :require_admin, only: [:destroy]

    # Requests: GET
    def index
        @users = User.all
    end
    
    # Requests: GET
    def new
        @user = User.new
    end

    #Request: POST
    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            flash[:success] = "Welcome to the G:SHOP #{@user.username}"
            redirect_to products_path
        else
            render 'new'
        end
    end

    # Requests: GET
    def edit
    end

    #to update user
    #Request: PATCH
    def update
        if @user.update(user_params)
            flash[:success] = "Your account was successfully updated"
            redirect_to products_path
        else
            render 'edit'
        end
    end

    # Requests: GET
    def show
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        flash[:danger] = "User and all product added by user have been deleted"
        redirect_to users_path
    end

    private
    def user_params
        params.require(:user).permit(:username, :email, :password, :wallet)
    end

    def set_user
        @user = User.find(params[:id])
    end

    def require_same_user
        if current_user != @user and !current_user.admin?
            flash[:danger] = "You can peform those action to only your own account and products"
            redirect_to root_path
        end
    end
    def require_admin
        if logged_in? and !current_user.admin?
            flash[:danger] = "Only admin user can perform that action"
            redirect_to root_path
        end
    end
end