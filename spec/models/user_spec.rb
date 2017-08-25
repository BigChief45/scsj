require 'rails_helper'

RSpec.describe User, type: :model do

  it 'has a valid factory' do
    expect(FactoryGirl.create(:user)).to be_valid
  end

  context 'validations' do
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_confirmation_of :password }
    it { is_expected.to validate_presence_of :first_name }
    it { is_expected.to validate_presence_of :last_name }
    it { is_expected.to validate_presence_of :mobile_number }
  end

  context 'instance methods' do
    let(:user) { FactoryGirl.create(:user) }

    it 'returns the user\'s full name' do
      expect(user.full_name).to eq("#{user.first_name} #{user.last_name}")
    end

  end
end
