class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    alias_action :create, :read, :update, :destroy, to: :crud

    can :read, Trial, secret: false

    if user.has_role?(:admin)
      can :manage, :all
    end

    if user.has_role?(:judge)
      can :create, Person
      can :read, Person
      can :search, Person

      can :read, User

      can :manage, Trial, judge_id: user.id

      can :manage, TrialPresentation, trial: { judge: user }
    end

    if user.has_role?(:lawyer)
      can :read, User

      can :read, Person

      can :read, Trial do |trial|
        user == trial.plaintiffs_lawyer || user == trial.defendants_lawyer
      end

      can :create, TrialPresentation, trial: { plaintiffs_lawyer: user }
      can :create, TrialPresentation, trial: { defendants_lawyer: user }

    end
  end

end
