class User < ActiveRecord::Base
    validates :username, presence: true, uniqueness: {case_sensitive: false }
    validates :email, presence: true, uniqueness: {case_sensitive: false }
end