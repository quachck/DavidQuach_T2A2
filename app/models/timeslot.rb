class Timeslot < ApplicationRecord
  belongs_to :workshop

  has_many :bookings, dependent: :destroy

  def update_ticket_count
    self.available_tickets -= 1
    self.save
  end
end
