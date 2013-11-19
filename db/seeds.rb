# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#	 cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#	 Mayor.create(name: 'Emanuel', city: cities.first)
new_params = { :name => "godmode" }
UserGroup.access_type_attributes.each do |attrs|
	new_params[attrs] = true
end
UserGroup.create(new_params)
