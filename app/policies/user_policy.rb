class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
    def show?
      current_user == @record.user
    end
  end
end
