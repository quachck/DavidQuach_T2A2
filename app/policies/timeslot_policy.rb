# frozen_string_literal: true

class TimeslotPolicy < WorkshopPolicy
  def update?
    user == record.workshop.user
  end
  def destroy?
    user == record.workshop.user
  end
  def create?
    user == record.workshop.user
  end
end
