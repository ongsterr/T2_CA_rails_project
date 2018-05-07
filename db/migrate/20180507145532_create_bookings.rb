class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.references :product, foreign_key: true
      t.references :transporter, index: true
      t.references :traveler, index: true
      t.string :booking_ref_number
      t.date :booking_date_from
      t.date :booking_date_to
      t.integer :number_of_traveler
      t.decimal :transporter_cost
      t.decimal :platform_cost
      t.decimal :total_cost
      t.boolean :booking_confirmed?

      t.timestamps
    end
    add_foreign_key :bookings, :users, column: :transporter_id
    add_foreign_key :bookings, :users, column: :traveler_id
  end
end
