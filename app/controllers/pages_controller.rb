class PagesController < ApplicationController
    def home #creating home action for pages controller basically action means the method/funtion
        redirect_to products_path if logged_in?
    end
    def about #about method/Action for peges controller 
        
    end
end