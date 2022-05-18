class Timeslot < ApplicationRecord
  belongs_to :workshop

  has_many :bookings, dependent: :destroy

  def update_ticket_count
    available_tickets =- 1
  end
end
