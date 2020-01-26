class User < ActiveRecord::Base

    has_many :products
    before_save { self.email = email.downcase }
    validates :username, presence: true, uniqueness: {case_sensitive: false }
    validates :email, presence: true, uniqueness: {case_sensitive: false }

    has_secure_password
end