class City < ActiveRecord::Base
    has_many :restaurants
    has_many :cuisines, through: :restaurants
end