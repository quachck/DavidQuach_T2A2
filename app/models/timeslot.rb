class Timeslot < ApplicationRecord
  belongs_to :workshop

  has_many :bookings

  def update_ticket_count
    available_tickets =- 1
  end
end
