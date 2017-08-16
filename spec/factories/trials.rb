FactoryGirl.define do
  factory :trial do
    title 'Demanda por Negligencia'
    description 'Blah blah blah'
    start_date { Date.today }
    judge { FactoryGirl.create(:user) }
    plaintiffs_lawyer { FactoryGirl.create(:user) }
    defendants_lawyer { FactoryGirl.create(:user) }
  end
end
