require 'rails_helper'

RSpec.describe TrialPresentation, type: :model do

  it 'has a valid factory' do
    expect(FactoryGirl.create(:trial_presentation)).to be_valid
  end

  context 'validations' do
    it { is_expected.to validate_presence_of :description }
  end

  context 'associations' do
    it { is_expected.to belong_to(:trial) }
    it { is_expected.to belong_to(:user) }
  end
end
