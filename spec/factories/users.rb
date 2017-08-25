FactoryGirl.define do
  factory :user do
    first_name 'John'
    last_name 'Doe'
    email { Faker::Internet.email }
    password 'password'
    password_confirmation 'password'
    mobile_number { Faker::PhoneNumber.cell_phone }
  end

  trait :admin do
    after(:create) { |user| user.add_role(:admin) }
  end

  trait :judge do
    after(:create) { |user| user.add_role(:judge) }
  end

  trait :lawyer do
    after(:create) { |user| user.add_role(:lawyer) }
  end

end
