FactoryGirl.define do
  factory :trial do
    title 'Demanda por Negligencia'
    description 'Blah blah blah'
    start_date { Date.today }
    judge { FactoryGirl.create(:user) }
  end
end
