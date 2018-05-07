class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.references :transporter, index: true
      t.decimal :price_per_day
      t.string :vehicle_model
      t.string :vehicle_capacity
      t.text :vehicle_description
      t.text :vehicle_image_data
      t.string :cancellation_policy
      t.text :things_to_note
      t.references :location, foreign_key: true, index: true

      t.timestamps
    end
    add_foreign_key :products, :users, column: :transporter_id
  end
end
