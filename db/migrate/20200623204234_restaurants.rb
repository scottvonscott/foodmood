class Restaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.references :city_id
    end
  end
end
