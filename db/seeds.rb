User.create(first_name: 'John', last_name: 'Doe', email: 'johndoe@gmail.com',
  password: '12345678', password_confirmation: '12345678')


# Create fake trials
10.times do
  Trial.create(
    title: 'Lorem Ipsum...',
    description: 'Blah blah blah blah',
    start_date: Date.today,
    secret: false
  )
end