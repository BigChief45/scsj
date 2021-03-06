require 'rails_helper'

RSpec.describe Trial, type: :model do

  it 'has a valid factory' do
    expect(FactoryGirl.create(:trial)).to be_valid
  end

  context 'validations' do
    let(:lawyer) { FactoryGirl.create(:user) }

    it { is_expected.to validate_presence_of :title }
    it { is_expected.to validate_presence_of :description }
    #it { is_expected.to validate_presence_of :secret }
    it { is_expected.to validate_presence_of :start_date }


    it 'validates that both lawyers are not the same' do
      expect(FactoryGirl.build(:trial, plaintiffs_lawyer: lawyer, defendants_lawyer: lawyer)).to_not be_valid
    end
  end

  context 'associations' do
    it { is_expected.to have_many :trial_people }
    it { is_expected.to have_many(:plaintiffs).through(:trial_people).source(:triable) }
    it { is_expected.to have_many(:defendants).through(:trial_people).source(:triable) }

    it { is_expected.to belong_to(:judge).class_name('User').with_foreign_key(:judge_id) }
    it { is_expected.to belong_to(:plaintiffs_lawyer).class_name('User').with_foreign_key(:plaintiffs_lawyer_id) }
    it { is_expected.to belong_to(:defendants_lawyer).class_name('User').with_foreign_key(:defendants_lawyer_id) }
  end

end
