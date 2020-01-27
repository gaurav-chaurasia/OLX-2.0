class UsersController < ApplicationController
    before_action :set_user, only: [:edit, :update, :show]
    before_action :require_same_user, only: [:edit, :update, :show]

    def index
        @users = User.all
    end
    
    def new
        @user = User.new
    end

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

    def edit
    end
    def update
        if @user.update(user_params)
            flash[:success] = "Your account was successfully updated"
            redirect_to products_path
        else
            render 'edit'
        end
    end

    def show
    end

    private
    def user_params
        params.require(:user).permit(:username, :email, :password)
    end

    def set_user
        @user = User.find(params[:id])
    end

    def require_same_user
        if current_user != @user
            flash[:danger] = "You can peform those action to only your own account and products"
            redirect_to root_path
        end
    end
end