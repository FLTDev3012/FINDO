class GiftPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
    def resolve
      scope.all # If users can see all restaurants
      # scope.where(user: user) # If users can only see their restaurants
      # scope.where("name LIKE 't%'") # If users can only see restaurants starting with `t`
      # ...
    end
  end

    def show?
      true
    end

    def new
      false
    end

    def create?
      false
    end

    def edit?
      false
    end

    def update?
      false
    end

    def destroy?
      false
    end
end
