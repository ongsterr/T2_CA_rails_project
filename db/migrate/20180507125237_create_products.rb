class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.references :user, foreign_key: true
      t.decimal :price_per_day
      t.string :vehicle_model
      t.string :vehicle_capacity
      t.text :vehicle_description
      t.text :vehicle_image_data
      t.string :cancellation_policy
      t.text :things_to_note
      t.references :location, foreign_key: true

      t.timestamps
    end
  end
end
