class Ability
  include CanCan::Ability

  def initialize(user)
    # Guest user
    user ||= User.new

    alias_action :create, :read, :update, :destroy, to: :crud

    if user.has_role? :admin
      can :manage, :all
    elsif user.has_role? :judge
      can :crud, Trial
    elsif user.has_role? :lawyer
      can :read, Trial
    end

  end
end
