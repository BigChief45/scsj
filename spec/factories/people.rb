FactoryGirl.define do
  factory :person do
    name 'Benito'
    last_name 'Camela'
    id_number '0801-1993-23209'
    birth_date { Date.today }
  end
end
