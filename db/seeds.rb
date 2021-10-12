# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if User.none?
  User.create!(
    name: 'admin',
    email: 'dat@gmail.com',
    password: '123456',
    password_confirmation: '123456',
    user_type: 1,
    status: 0
  )

  20.times do |n|
    name = "staff-#{n+1}"
    email = "staff-#{n+1}@railstutorial.org"
    password = "123456"
    User.create!(
      name: name,
      email: email,
      password:password,
      password_confirmation: password,
      user_type: 0,
      status: 0
    )
  end
end
