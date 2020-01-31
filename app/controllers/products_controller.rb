#controller going to look for new action under view/ products folder and then new 
class ProductsController < ApplicationController
    before_action :set_product, only: [:edit, :update, :show, :destroy, :toggle_status_buy]
    before_action :require_user, except: [:index, :show]
    before_action :require_same_user, only: [:edit, :update, :destroy]

    # Get a list of all products visible to all user only
    # Requests: GET
    def index
        # products instance varible will have all products and then will iterate through all 
        @products = Product.all
    end
    
    # Requests: GET
    def new 
        #new action for adding new product in product controller to product tabl/relation
        @product = Product.new #creating instance variable
    end

    #to edit product details
    #request: GET 
    def edit
        #for edit action in product controller we have to find the product through id
    end
    
    #Request: POST
    def create 
        @product = Product.new(product_params)
        @product.user = current_user
        if @product.save
            flash[:success] = "product was successfully added"
            redirect_to product_path(@product)
        else
            render 'new'
        end
    end

    #to update product
    #Request: PATCH
    def update
        if @product.update(product_params)
            flash[:success] = "Product was successfully updated"
            redirect_to product_path(@product)
        else
            render 'edit'
        end
    end

    #to show products details
    #Request: GET
    def show
        # find products from params with appropriate ID
        # for example  product/(3 = id)
    end

    #to delete the products history/details
    #Request: Delete
    def destroy
        @product.destroy
        flash[:danger] = "Product was successfully deleted"
        redirect_to products_path
    end

    def toggle_status_buy
        if current_user.wallet >= @product.cost && logged_in?
            current_user.wallet = current_user.wallet - @product.cost
            @product.user_id = current_user.id
            @product.sold = true
            # current_user.wallet.save  #some error need to be fixed
            @product.save
            flash[:success] = "Product is succesfully purchased"
            redirect_to user_path(current_user)
        else
            flash[:info] = "You don't have sufficient amount to buy this product"
            redirect_to products_path
        end
    end

    private
        def product_params
            params.require(:product).permit(:name, :cost, :description, :age, :address, :image, :visibility)
        end
        def set_product
            @product = Product.find(params[:id])
        end
        def require_same_user
            if current_user != @product.user and !current_user.admin?
                flash[:danger] = "You can only edit or delete your own products"
                redirect_to root_path
            end
        end
end