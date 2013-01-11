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
		admin_group = UserGroup.new(:name => "admin",
                                 :user_editing => true,
                                 :store_editing => true)
    admin_group.save!

		users.each do |u|
			user = User.find_by_username(u)
			user.user_groups = [admin_group]
			user.save!
			puts "#{u} is now admin"
		end	
	end
end
