# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.admin?
      can [:read, :create], User
      can [:update, :destroy], User, user_type: 'staff'
    else
      can [:read, :update], User, id: user.id
    end
  end
end
