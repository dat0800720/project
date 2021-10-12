# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.admin?
      can [:read, :create], User
      can [:update, :destroy], User, user_type: 'staff'
      can [:update, :destroy], User, id: user.id
      can [:manage], Member
      can [:manage], Holiday
    else
      can [:read, :update], User, id: user.id
      can [:read], Member, user_id: user.id
    end
  end
end
