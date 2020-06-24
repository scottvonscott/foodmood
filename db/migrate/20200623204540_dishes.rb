class Dishes < ActiveRecord::Migration
  def change
    create_table :dishes do |t|
      t.string :name
      t.references :restaurant_id
      t.references :cuisine_id
    end
  end
end