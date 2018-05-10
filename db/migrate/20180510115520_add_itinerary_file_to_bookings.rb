class AddItineraryFileToBookings < ActiveRecord::Migration[5.1]
  def change
    add_column :bookings, :itinerary_file_data, :text
  end
end
