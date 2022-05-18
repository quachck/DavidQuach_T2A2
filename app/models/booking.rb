class Booking < ApplicationRecord
  belongs_to :timeslot

  belongs_to :instructor, class_name: "User"
  belongs_to :attendee, class_name: "User"
end
