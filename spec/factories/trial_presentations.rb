FactoryGirl.define do
  factory :trial_presentation do
    description 'Blah blah blah'
    trial { FactoryGirl.create(:trial) }
    user { trial.judge }
  end
end
