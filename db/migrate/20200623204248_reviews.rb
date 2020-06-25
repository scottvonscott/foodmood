class Reviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :title
      t.text :description
      t.references :user
      t.references :restaurant
    end
  end
end