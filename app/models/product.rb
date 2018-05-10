class Product < ApplicationRecord
  belongs_to :transporter, class_name: 'User'
  belongs_to :location
  has_many :bookings

  include ImageUploader[:vehicle_image] # part of Shrine setup
  include FileUploader[:itinerary_file] # part of Shrine setup

end
