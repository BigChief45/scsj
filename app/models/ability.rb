class Ability
  include CanCan::Ability

  def initialize(user)
    # Guest user
    user ||= User.new

    alias_action :create, :read, :update, :destroy, to: :crud

    can :read, Trial
    can :read, Trial, secret: false

    cannot :read, Trial, secret: true
    cannot :create, TrialPresentation

    if user.has_role? :judge
      can :create, Person
      can :manage, Trial, judge_id: user.id
    end

    if user.has_role? :lawyer
      can :read, Trial do |trial|
        user == trial.plaintiffs_lawyer || user == trial.defendants_lawyer
      end

      can :create, TrialPresentation, trial: { plaintiffs_lawyer: user }
      can :create, TrialPresentation, trial: { defendants_lawyer: user }

    end

    if user.has_role? :admin
      can :manage, :all
    end

  end
end
