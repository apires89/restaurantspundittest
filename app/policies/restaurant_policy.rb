class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end

  end

    def new?
     true
    end

    def show?
      true  # Anyone can view a restaurant
    end

    def create?
      true
    end

    def update?
    record.user == user || user.admin
    # - record: the restaurant passed to the `authorize` method in controller
    # - user:   the `current_user` signed in with Devise.
  end

  def destroy?
    record.user == user || user.admin
  end
end
