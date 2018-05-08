class Booking < ApplicationRecord
  belongs_to :product
  belongs_to :transporter, class_name: 'User'
  belongs_to :traveler, class_name: 'User'
  has_many :reviews
end
