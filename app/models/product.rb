class Product < ActiveRecord::Base
    belongs_to :user
    has_one_attached :image
    
    validates :name, presence: true
    validates :description, presence: true
    validates :cost, presence: true
    validates :address, presence: true
    validates :user_id, presence: true

end