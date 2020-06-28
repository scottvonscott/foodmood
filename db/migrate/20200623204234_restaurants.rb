class Restaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.references :city
      t.references :cuisine
    end
  end
end
