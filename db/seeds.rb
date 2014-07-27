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