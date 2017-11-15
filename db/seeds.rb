# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do |i|
  User.create!(email: "saroar#{i}@gmail.com", password: 'password', name: "Alex#{i}", surname: "Surname#{i}", birthday: Time.now - 18.years)
end

p "Created Total user #{User.count}"


# Talent.create!(surname: "Saroar",
#                given_name: "Khandoker",
#                place_of_birth: "Dhaka",
#                date_of_birth: Time.now - 18.years,
#                date_of_issue: Time.now - 5.years,
#                date_of_expiry: Time.now + 5.years,
#                passport_copy: "sfasfsaf",
#                starting_payment: 500,
#                due_payment: 2500,
#                case_number: "dfasfa",
#               user_id: u.id
# )
