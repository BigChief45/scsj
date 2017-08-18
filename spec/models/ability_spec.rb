require 'rails_helper'
require 'cancan/matchers'

RSpec.describe Ability, type: :model do

  describe 'Judge' do
    describe 'abilities' do
      subject(:ability) { Ability.new(user) }
      let(:user) { FactoryGirl.create(:user, :judge) }

      it { should_not be_able_to(:manage, User) }
      it { should_not be_able_to(:manage, Person) }
      it { should be_able_to(:create, Person) } # NOTE: Limited only in view

      it { should be_able_to(:manage, Trial.new(judge: user)) }
      it { should_not be_able_to(:manage, Trial.new) }
      it { should be_able_to(:read, Trial.new(secret: false)) }
      it { should_not be_able_to(:read, Trial.new(secret: true)) }

      it { should be_able_to(:manage, TrialPresentation.new(trial: Trial.new(judge: user))) }
      it { should_not be_able_to(:manage, TrialPresentation.new) }
    end
  end

  describe 'Lawyer' do
    describe 'abilities' do
      subject(:ablity) { Ability.new(user) }
      let(:user) { FactoryGirl.create(:user, :lawyer) }

      it { should be_able_to(:read, Trial.new(secret: false)) }
      it { should_not be_able_to(:read, Trial.new(secret: true)) }
      it { should be_able_to(:read, Trial.new(secret: true, plaintiffs_lawyer: user)) }
      it { should be_able_to(:read, Trial.new(secret: true, defendants_lawyer: user)) }

      it { should be_able_to(:create, TrialPresentation.new(trial: Trial.new(plaintiffs_lawyer: user))) }
      it { should be_able_to(:create, TrialPresentation.new(trial: Trial.new(defendants_lawyer: user))) }
      it { should_not be_able_to(:create, TrialPresentation.new()) }

    end
  end

  describe 'Guest User' do
    describe 'abilities' do
      subject(:ability) { Ability.new(User.new) }

      it { should be_able_to(:read, Trial) }
    end
  end

end