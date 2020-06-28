class Restaurant < ActiveRecord::Base
    belongs_to :city
    belongs_to :cuisine
    has_many :dishes
    has_many :reviews
    
end