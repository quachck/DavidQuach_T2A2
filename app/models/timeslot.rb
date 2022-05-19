class Timeslot < ApplicationRecord
  validates :day, :start_time, :end_time, :price, :available_tickets, presence: true
  validates :price, :available_tickets, numericality: { greater_than: 0 }
  validates :start_time, comparison: { greater_than: :end_time }

  belongs_to :workshop

  has_many :bookings, dependent: :destroy

  def update_ticket_count
    self.available_tickets -= 1
    self.save
  end
end
