# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Destroying Records"
User.destroy_all
Stockist.destroy_all
Address.destroy_all
Listing.destroy_all
Brand.destroy_all

puts "Populating Users"

user1 = User.create!(
	first_name: 'Test',
	last_name: 'One',
	email: 'test@one.com',
	password: 'password'
)

puts "Populating Stockists"

stockist1 = user1.create_stockist(
	business_name: 'Business Test One',
	abn: '51824753551'
)

puts "Populating Addresses"

stockist1.addresses.create!(
	address_line1: '100 Toorak Road',
	suburb: 'Toorak',
	state: 'VIC',
	postcode: '3142'
)

puts "Addresses populated"
# User.create(
# 	first_name: 'Test',
# 	last_name: 'Two',
# 	email: 'test@two.com',
# 	password: 'password',
# 	Stockist.create!(
# 		business_name: 'Business Test Two',
# 		abn: '51824753552'
# 	)
# )
# User.create(
# 	first_name: 'Test',
# 	last_name: 'Three',
# 	email: 'test@three.com',
# 	password: 'password',
# 	Stockist.create!(
# 		business_name: 'Business Test Three',
# 		abn: '51824753553'
# 	)
# )
# User.create(
# 	first_name: 'Test',
# 	last_name: 'Four',
# 	email: 'test@four.com',
# 	password: 'password',
# 	Stockist.create!(
# 		business_name: 'Business Test Four',
# 		abn: '51824753554'
# 	)
# )
# User.create(
# 	first_name: 'Test',
# 	last_name: 'Five',
# 	email: 'test@five.com',
# 	password: 'password',
# 	Stockist.create!(
# 		business_name: 'Business Test Five',
# 		abn: '51824753555'
# 	)
# )

puts "Populating Brands"

4.times do |i|
	brand = Brand.create(name: "Coffee Brand #{i}")
end

10.times do
	listing = stockist1.listings.create!(
		name: Faker::Coffee.blend_name,
		origin: Faker::Coffee.origin,
		flavour_profile: Faker::Coffee.notes,
		bean_type: 'Single Origin',
		description: 'blahhhhhhhhhh',
	)
	grind = listing.grinds.create!(
		bean_grind: 'Whole Beans',
	)
end

puts "Brand Populated"


# Faker::Coffee.blend_name #=> "Summer Solstice"

# Faker::Coffee.origin #=> "Antigua, Guatemala"

# Faker::Coffee.variety #=> "Pacas"

# Faker::Coffee.notes #=> "balanced, silky, marzipan, orange-creamsicle, bergamot"

# Faker::Coffee.intensifier #=> "quick"
