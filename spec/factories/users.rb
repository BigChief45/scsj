FactoryGirl.define do
  factory :user do
    first_name 'John'
    last_name 'Doe'
    email 'john_doe@gmail.com'
    password 'password'
    password_confirmation 'password'
  end
end