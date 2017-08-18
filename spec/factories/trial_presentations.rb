FactoryGirl.define do
  factory :trial_presentation do
    description 'Blah blah blah'
    trial { FactoryGirl.create(:trial) }
    lawyer { FactoryGirl.create(:user) } # TODO: Reference trial's lawyer instead
  end
end
