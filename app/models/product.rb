class Product < ApplicationRecord
  belongs_to :user
  belongs_to :location
  has_many :bookings

  include ImageUploader[:vehicle_image] # part of Shrine setup

end
