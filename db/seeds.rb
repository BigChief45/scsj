admin = User.create(first_name: 'John', last_name: 'Doe',
  email: 'johndoe@gmail.com', password: '12345678',
  password_confirmation: '12345678')
admin.add_role :admin

judge = User.create(first_name: 'Jamie', last_name: 'Lannister',
  email: 'jlan@gmail.com', password: '12345678',
  password_confirmation: '12345678')
judge.add_role :judge

lawyer = User.create(first_name: 'Robert', last_name: 'Baratheon',
  email: 'rbarat@gmail.com', password: '12345678',
  password_confirmation: '12345678')
lawyer.add_role :lawyer

# People
Person.create(name: 'Pablo', last_name: 'Escobar',
  id_number: '0801-1990-23221', birth_date: Date.today)
  Person.create(name: 'Pablo', last_name: 'Hernandez',
  id_number: '0801-1990-90234', birth_date: Date.today)
Person.create(name: 'Enrique', last_name: 'Iglesias',
  id_number: '0801-1990-29876', birth_date: Date.today)

# Create fake trials
10.times do
  Trial.create(
    title: Faker::Lorem.sentence,
    description: Faker::Lorem.paragraph(10),
    start_date: Date.today,
    secret: false,
    judge: judge
  )
end