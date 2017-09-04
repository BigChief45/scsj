FactoryGirl.define do
  factory :notification do
    recipient { FactoryGirl.create(:user) }
    actor { FactoryGirl.create(:user) }
    read_at nil
    action 'posted'
    notifiable { FactoryGirl.create(:trial_presentation) }
  end
end
