# frozen_string_literal: true

class BookingPolicy < WorkshopPolicy
  def create?
    user != record.user
  end
end
