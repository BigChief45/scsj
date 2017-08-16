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
    end
  end

end