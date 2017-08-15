require 'rails_helper'

RSpec.describe Trial, type: :model do

  it 'has a valid factory' do
    expect(FactoryGirl.create(:trial)).to be_valid
  end

  context 'validations' do
    it { is_expected.to validate_presence_of :title }
    it { is_expected.to validate_presence_of :description }
    #it { is_expected.to validate_presence_of :secret }
    it { is_expected.to validate_presence_of :start_date }
  end

  context 'associations' do
    it { is_expected.to have_many :trial_people }

    it { is_expected.to have_many(:plaintiffs).through(:trial_people).source(:triable) }
    it { is_expected.to have_many(:defendants).through(:trial_people).source(:triable) }
  end

end
