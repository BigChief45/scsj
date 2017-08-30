require 'rails_helper'

RSpec.describe Notification, type: :model do

  it 'has a valid factory' do
    expect(FactoryGirl.create(:notification)).to be_valid
  end

  context 'associations' do
    it { is_expected.to belong_to(:recipient).class_name('User') }
    it { is_expected.to belong_to(:actor).class_name('User') }
    it { is_expected.to belong_to(:notifiable) }
  end

end
