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
Grind.destroy_all

puts "Populating Grinds"

grinds_data = ['Whole Beans', 'Espresso', 'Stove Top', 'Cold Brew', 'Batch Brew', 'Plunger', 'Pour Over', 'French Press', 'Aero Press', 'Reusable Pods', 'Turkish']

grinds_data.each do |grind|
	Grind.create!(
		bean_grind: "#{grind}"
	)
end

puts "Grinds Populated"

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

puts "Stockist Populated"

puts "Populating Brands"

5.times do |i|
	Brand.create!(
		brand: "Coffee Brand #{i}"
	)
end

puts "Brand Populated"

puts "Populating Stockist Brands"

2.times do 
	stockist1.stockist_brands.create!( 
		brand: Brand.all.sample
	)
end

puts "Stockist Brands Populated"

puts "Populating Addresses"

stockist1.addresses.create!(
	address_line1: '100 Toorak Road',
	address_line2: '',
	suburb: 'Toorak',
	state: 'VIC',
	postcode: '3142'
)

puts "Addresses populated"

puts "Populating Listings attached to stockist 1"

#brand_select = stockist1.brands.all
grind_select = Grind.all
10.times do
	brand = stockist1.brands.sample
	listing = stockist1.listings.create!(
		name: Faker::Coffee.blend_name,
		origin: Faker::Coffee.origin,
		flavour_profile: Faker::Coffee.notes,
		bean_type: 'Single Origin',
		description: 'blahhhhhhhhhh',
		brand: brand,
	)
	grind = listing.listing_grinds.create!(
		grind: grind_select.sample
	)
	size = listing.sizes.create!(
		size: 250,
		price: rand(15..40),
		active: TRUE
	)
	price = listing.sizes.create!(
		size: 500,
		price: rand(50..70),
		active: TRUE
	)
end

puts "Listing Populated"

# create_table "listings", force: :cascade do |t|
# 	t.string "name"
# 	t.string "origin"
# 	t.text "flavour_profile"
# 	t.integer "bean_type"
# 	t.bigint "stockist_id", null: false
# 	t.datetime "created_at", precision: 6, null: false
# 	t.datetime "updated_at", precision: 6, null: false
# 	t.text "description"
# 	t.string "roast"


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

# Faker::Coffee.blend_name #=> "Summer Solstice"

# Faker::Coffee.origin #=> "Antigua, Guatemala"

# Faker::Coffee.variety #=> "Pacas"

# Faker::Coffee.notes #=> "balanced, silky, marzipan, orange-creamsicle, bergamot"

# Faker::Coffee.intensifier #=> "quick"
