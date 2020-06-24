class Restaurant < ActiveRecord::Base
    belongs_to :city
    has_many :dishes
    has_many :cuisines, through: :dishes
    has_many :reviews
    has_many :ratings, through: :reviews
    
end