require 'rails_helper'

RSpec.describe Notification, type: :model do

  subject { FactoryGirl.create(:notification) }

  it { is_expected.to be_valid }

  context 'associations' do
    it { is_expected.to belong_to(:recipient).class_name('User') }
    it { is_expected.to belong_to(:actor).class_name('User') }
    it { is_expected.to belong_to(:notifiable) }
  end

  it 'e-mails the notification' do
    expect(ActionMailer::Base.deliveries.count).to eq(5)
  end

end
