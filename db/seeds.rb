# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


first_names = [
	'Adam', 'Bob', 'Carol','David',	'Eddie','Frank','George','Harry',
	'Ike','Jim','Kenny','Larry', 'Mary','Nancy','Oliver','Peter',
	'Quincy','Roger','Sam','Thomas', 'Victor','Vincent','William',
	'Joseph', 'David', 'Michael', 'Jacob', 'Moshe', 'Daniel', 'Alex', 'Benjamin',
	'Samuel', 'James', 'Emma', 'Leah', 'Sarah', 'Olivia', 'Sophia',	'Esther',
	'Rachel', 'Chaya', 'Ava', 'Chana', 'Miriam'
]


number_of_users = 50
for i in (1..number_of_users)

	fname = first_names.shuffle[0,1].join
	lname = (:A..:Z).to_a.shuffle[0,1].join + (:a..:z).to_a.shuffle[0,5].join;
	digit = Random.new.rand(0..99)
	email = "#{fname}.#{lname}.#{digit}@gmail.com"

	@user = User.where(email: email).first
	if @user == nil
		User.create!(
		first_name: fname,
		last_name: lname,
		nickname: "#{lname}.#{digit}",
		email: email,
		password: "000000",
		password_confirmation: "000000",
		status: 'active'
		)
	end
end

for i in (0..9)
	vin = "19XFA1E50BE00000#{i}"
	Vehicle.create!(
	vin: vin,
	manufacturer: 'Honda',
	model: 'Civic',
	year: '2011',
	color: '',
	user_id: (1..number_of_users).to_a.shuffle[0,1].join
	)

	vin = "19XFB2F51DE00000#{i}"
	Vehicle.create!(
	vin: vin,
	manufacturer: 'Honda',
	model: 'Civic',
	year: '2013',
	color: '',
	user_id: (1..number_of_users).to_a.shuffle[0,1].join
	)

	vin = "2HNYD2H20CH00000#{i}"
	Vehicle.create!(
	vin: vin,
	manufacturer: 'Acura',
	model: 'MDX',
	year: '2012',
	color: '',
	user_id: (1..number_of_users).to_a.shuffle[0,1].join
	)

	vin = "2HNYD2H23CH00000#{i}"
	Vehicle.create!(
	vin: vin,
	manufacturer: 'Acura',
	model: 'MDX',
	year: '2012',
	color: '',
	user_id: (1..number_of_users).to_a.shuffle[0,1].join
	)

	vin = "2G1SCHED4C900000#{i}"
	Vehicle.create!(
	vin: vin,
	manufacturer: 'Chevrolet',
	model: 'Suburban',
	year: '2012',
	color: '',
	user_id: (1..number_of_users).to_a.shuffle[0,1].join
	)
end




# Listing.create!(
# 	user_id: 1,
# 	vehicle_id: 1,
# 	price: '7000',
# 	currency: 'USD',
# 	status: 'active',
# 	city: 'San Jose',
# 	state: 'California',
# 	country: 'United States',
# 	zip_code: '',
# 	description: 'used car, but in good status'
# 	)

# Listing.create!(
# 	user_id: 1,
# 	vehicle_id: 2,
# 	price: '13000',
# 	currency: 'USD',
# 	status: 'active',
# 	city: 'San Jose',
# 	state: 'California',
# 	country: 'United States',
# 	zip_code: '',
# 	description: 'like new, rarely use'
# 	)

# Listing.create!(
# 	user_id: 2,
# 	vehicle_id: 3,
# 	price: '3500',
# 	currency: 'USD',
# 	status: 'active',
# 	city: 'San Francisco',
# 	state: 'California',
# 	country: 'United States',
# 	zip_code: '',
# 	description: 'a bit old, but can still serve you well'
# 	)

# Listing.create!(
# 	user_id: 4,
# 	vehicle_id: 4,
# 	price: '5000',
# 	currency: 'USD',
# 	status: 'active',
# 	city: 'San Francisco',
# 	state: 'California',
# 	country: 'United States',
# 	zip_code: '',
# 	description: 'fairly good'
# 	)
