class Ability
  include CanCan::Ability

  def initialize(user)
    # Guest user
    user ||= User.new

    alias_action :create, :read, :update, :destroy, to: :crud

    if user.has_role? :admin
      can :manage, :all
    elsif user.has_role? :judge
      can :create, Person

      cannot :read, Trial, secret: true
      can :read, Trial, secret: false
      can :manage, Trial, judge_id: user.id

    elsif user.has_role? :lawyer
      can :read, Trial
    else
      can :read, Trial
    end

  end
end
