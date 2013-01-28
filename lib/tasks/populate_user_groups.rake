namespace :db do
	desc "populates the database with user groups"

	task :populate_user_groups, [:amount, :delete] => :environment do |t, args|
		args.with_defaults(:delete => 'true')
		delete = args[:delete] == 'true'
		users = ["peanut", "Enermis"]
		puts "--------------------"
		puts "Creating User Groups"
		puts "--------------------"

		UserGroup.delete_all
		params = { :name => "admin" }
		UserGroup.access_type_attributes.each do |attrs|
			params[attrs] = true
		end
		admin_group = UserGroup.new(params)
		admin_group.save! if admin_group.valid?

		users.each do |u|
			user = User.find_by_username(u)
			user.user_groups = [admin_group]
			user.save! if user.valid?
			puts "#{u} is now admin"
		end
	end
end
