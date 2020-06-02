class CreateRaves < ActiveRecord::Migration
  def change
    create_table :raves do |t|
      t.string :name
      t.integer :travel_cost
      t.integer :food_cost
      t.integer :hotel_cost
      t.integer :total
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
