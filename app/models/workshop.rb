class Workshop < ApplicationRecord
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings

  has_many :timeslots, dependent: :destroy
end
