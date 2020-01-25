#controller going to look for new action under view/ products folder and then new 
class ProductsController < ApplicationController
    
    # Get a list of all questions
    # Requests: GET
    def index
        # products instance varible will have all products and then will iterate through all 
        @products = Product.all
    end
    
    def new 
        #new action for adding new product in product controller to product tabl/relation
        @product = Product.new #creating instance variable
    end

    #to edit product details
    #request: GET 
    def edit
        #for edit action in product controller we have to find the product through id
        @product = Product.find(params[:id])
    end
    
    #Request: POST
    def create 
        @product = Product.new(product_params)
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
        @product = Product.find(params[:id])
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
        @product = Product.find(params[:id])
        # find products from params with appropriate ID
        # for example  product/(3 = id)
    end

    #to delete the products history/details
    #Request: Delete
    def destroy
        @product = Product.find(params[:id])
        @product.destroy
        flash[:danger] = "Product was successfully deleted"
        redirect_to products_path
    end

    private
        def product_params
            params.require(:product).permit(:name, :cost, :description, :age, :address, :image)
        end
end