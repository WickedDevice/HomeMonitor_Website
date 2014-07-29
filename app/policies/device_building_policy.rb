class DeviceBuildingPolicy < ApplicationPolicy
  class Scope < Struct.new(:user, :scope)
    def resolve
      return scope.none if user.nil?
      return scope if user.admin?
      scope.where(device_id: Building.where(user_id: user.id))
    end
  end
end
