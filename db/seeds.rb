# Create initial roles
puts 'Creating roles...'
Role.create!(name: 'admin')
Role.create!(name: 'judge')
Role.create!(name: 'lawyer')

if Rails.env.development?

  admin = User.create!(first_name: 'John', last_name: 'Doe',
    mobile_number: Faker::PhoneNumber.cell_phone,
    email: 'admin@admin.com', password: '12345678',
    password_confirmation: '12345678')
  admin.add_role :admin


  # Create judges
  puts 'Creating judges...'
  5.times do
    judge = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,
      email: Faker::Internet.unique.email, password: '12345678',
      mobile_number: Faker::PhoneNumber.cell_phone,
      password_confirmation: '12345678')
    judge.add_role :judge
  end

  # Create lawyers
  puts 'Creating lawyers...'
  20.times do
    lawyer = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,
      email: Faker::Internet.unique.email, password: '12345678',
      mobile_number: Faker::PhoneNumber.cell_phone,
      password_confirmation: '12345678')
    lawyer.add_role :lawyer
  end


  # People
  puts 'Creating people...'
  5.times do
    Person.create!(name: Faker::Name.first_name, last_name: Faker::Name.last_name,
      id_number: Faker::Number.number(12), birth_date: Date.today)
  end


  # Create fake trials
  puts 'Creating trials...'
  10.times do
    lawyers = User.lawyers.limit(2).order('RANDOM()')
    trial = Trial.create!(
      title: Faker::Book.title,
      description: Faker::Lorem.paragraph(10),
      start_date: Date.today,
      secret: [true, false].sample,
      judge: User.judges.order('RANDOM()').limit(1).first,
      plaintiffs_lawyer: lawyers.first,
      defendants_lawyer: lawyers.last,
      plaintiff_ids: Person.order('RANDOM()').limit(1).map { |p| p.id },
      defendant_ids: Person.order('RANDOM()').limit(1).map { |p| p.id }
    )

    Random.rand(10).times do
      trial.trial_presentations.create!(
        description: Faker::Lorem.paragraph(Random.rand(20) + 5),
        user: [trial.plaintiffs_lawyer, trial.defendants_lawyer, trial.judge].sample
        )
    end
  end

end