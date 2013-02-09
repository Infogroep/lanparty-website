namespace :db do
	desc "populates the database with teams"

	task :populate_teams, [:amount, :delete] => :environment do |t, args|
		args.with_defaults(:delete => 'true')
		delete = args[:delete] == 'true'
		amount = args[:amount].to_i

		users_to_create = [amount - User.count, 0].min
		compos_to_create = [amount - Compo.count, 0].min
		puts "creating #{users_to_create} extra users"
		Rake::Task["db:populate_users"].invoke(users_to_create, 'false')
		puts "creating #{compos_to_create} extra compos"
		Rake::Task["db:populate_compos"].invoke(compos_to_create, 'false')


		puts "--------------"
		puts "Creating teams"
		puts "--------------"

		Team.delete_all
		amount.times do
			team = FactoryGirl.build("team")
			team.compo = Compo.all.sample
			team.users << User.all.sample(team.compo.group_size+1)
			team.save!
			puts "creating #{team.name}"
		end
	end
end
