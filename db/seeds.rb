# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

1000.times do
	Sale.create(blend: Faker::Coffee.blend_name, origin: Faker::Coffee.origin, price: Faker::Number.between(from: 1990, to: 5990), amount: Faker::Number.between(from: 1, to: 100), date_time: Faker::Date.between(from: Date.new(2017, 1, 1), to: Date.today))
end