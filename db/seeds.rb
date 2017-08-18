# Create initial roles
puts 'Creating roles...'
Role.create!(name: 'admin')
Role.create!(name: 'judge')
Role.create!(name: 'lawyer')

admin = User.create!(first_name: 'John', last_name: 'Doe',
  email: 'admin@gmail.com', password: '12345678',
  password_confirmation: '12345678')
admin.add_role :admin


# Create judges
5.times do
  judge = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,
    email: Faker::Internet.email, password: '12345678',
    password_confirmation: '12345678')
  judge.add_role :judge
end

# Create lawyers
20.times do
  lawyer = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,
    email: Faker::Internet.email , password: '12345678',
    password_confirmation: '12345678')
  lawyer.add_role :lawyer
end


# People
5.times do
  Person.create!(name: Faker::Name.first_name, last_name: Faker::Name.last_name,
    id_number: Faker::Number.number(12), birth_date: Date.today)
end


# Create fake trials
10.times do
  lawyers = User.lawyers.limit(2).order('RANDOM()')
  Trial.create!(
    title: Faker::Lorem.sentence,
    description: Faker::Lorem.paragraph(10),
    start_date: Date.today,
    secret: [true, false].sample,
    judge: User.judges.order('RANDOM()').limit(1).first,
    plaintiffs_lawyer: lawyers.first,
    defendants_lawyer: lawyers.last,
    plaintiff_ids: Person.order('RANDOM()').limit(1).map { |p| p.id },
    defendant_ids: Person.order('RANDOM()').limit(1).map { |p| p.id }
  )
end