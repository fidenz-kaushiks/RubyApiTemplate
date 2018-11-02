# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if Rails.env.development?
  #  Uncomment this section and add user Roles That you want
  UserRole.create!([
    { role_name: 'Admin', slug: 'admin' },
    { role_name: 'User', slug: 'user' }
  ])
  User.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password', user_role_id: 1) if Rails.env.development?
end
