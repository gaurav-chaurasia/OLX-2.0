class Product < ActiveRecord::Base
    has_one_attached :image
    
    validates :name, presence: true
    validates :description, presence: true
    validates :cost, presence: true
    validates :address, presence: true

end