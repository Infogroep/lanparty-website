namespace :db do
	desc "populates the database with users"

	task :populate_users, [:amount] => :environment do |t, args|
		require 'lanparty_faker'
		amount = args[:amount].to_i
		puts "--------------"
		puts "Creating Users"
		puts "--------------"

		User.delete_all
		User.create(
			:username => "Enermis",
			:email => "fulgens.ailurus@gmail.com",
			:password => "roeland1",
			:password_confirmation => "roeland1"
		)
		puts "created Enermis"
		amount.times do
			user = FactoryGirl.create("user")
			puts "creating #{user.username}"
		end
	end
end
