# frozen_string_literal: true

class WorkshopPolicy < ApplicationPolicy
  def update?
    user == record.user
  end
  def destroy?
    user == record.user
  end
  def create?
    user == record.user
  end
end
