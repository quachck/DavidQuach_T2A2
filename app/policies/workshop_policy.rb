# frozen_string_literal: true

class WorkshopPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    user == record.user
  end

  def new?
    create?
  end

  def update?
    user && (user.id == record.user_id)
  end
  

  def edit?
    update?
  end

  def destroy?
    user && (user == record.user)
  end

  class Scope
    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      raise NotImplementedError, "You must define #resolve in #{self.class}"
    end

    private

    attr_reader :user, :scope
  end
end
