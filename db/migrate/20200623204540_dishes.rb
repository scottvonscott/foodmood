class Dishes < ActiveRecord::Migration
  def change
    create_table :dishes do |t|
      t.string :name
      t.references :restaurant
      t.references :cuisine
    end
  end
end