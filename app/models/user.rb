class User < ActiveRecord::Base

    has_many :products, dependent: :destroy # this takes care of all products assosiated with user
    before_save { self.email = email.downcase }
    validates :username, presence: true, uniqueness: {case_sensitive: false }
    validates :email, presence: true, uniqueness: {case_sensitive: false }

    has_secure_password
end