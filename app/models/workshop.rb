class Workshop < ApplicationRecord
  resourcify
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings

  has_many :timeslots
  has_one_attached :img
end
