FactoryGirl.define do
  factory :person do
    name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    id_number { Faker::Number.number(12) }
    birth_date { Date.today }
  end
end
