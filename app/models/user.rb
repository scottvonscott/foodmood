class User < ActiveRecord::Base
    has_secure_password
    has_many :reviews
    validates :username, presence: true
    validates :username, uniqueness: true
end