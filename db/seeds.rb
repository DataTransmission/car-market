# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


for i in (1..3)
	@user = User.where(email: 'fln#{i}@gmail.com').first
	if @user && @user.status.blank?
		@user.update_attributes(status: 'active')
	else
		User.create!(
			first_name:"fname#{i}",
			last_name:"lname#{i}", 
			nickname:"nname#{i}", 
			email: "fln#{i}@gmail.com", 
			password: "000000", 
			password_confirmation: "000000",
			status: 'active'
			)
	end
end

Vehicle.create!(
	vin: '19XFA1E50BE000000',
	manufacturer: 'Honda',
	model: 'Civic',
	year: '2011',
	color: '',
	user_id: 1
	)
Vehicle.create!(
	vin: '19XFB2F51DE000000',
	manufacturer: 'Honda',
	model: 'Civic',
	year: '2013',
	color: '',
	user_id: 1
	)


Vehicle.create!(
	vin: '2HNYD2H20CH000000',
	manufacturer: 'Acura',
	model: 'MDX',
	year: '2012',
	color: '',
	user_id: 1
	)

Vehicle.create!(
	vin: '2HNYD2H23CH000000',
	manufacturer: 'Acura',
	model: 'MDX',
	year: '2012',
	color: '',
	user_id: 1
	)

Vehicle.create!(
	vin: '2G1SCHED4C9000000',
	manufacturer: 'Chevrolet',
	model: 'Suburban',
	year: '2012',
	color: '',
	user_id: 1
	)


