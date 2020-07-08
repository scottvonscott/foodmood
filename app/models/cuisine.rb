class Cuisine < ActiveRecord::Base
    has_many :restaurants

    def self.all_sorted
        Cuisine.all.sort_by do |cuisine|
            cuisine.name
        end
    end
end