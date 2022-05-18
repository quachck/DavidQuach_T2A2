class Timeslot < ApplicationRecord
  belongs_to :workshop

  private

  def update_ticket_count
    available_tickets -= 1
  end

end
