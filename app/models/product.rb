class Product < ActiveRecord::Base
    validates :name, presence: true
    validates :description, presence: true
    validates :cost, presence: true
    validates :address, presence: true
end