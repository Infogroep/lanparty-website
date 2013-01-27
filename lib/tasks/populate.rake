namespace :db do
	desc "populates the database"

	task :populate, [:amount, :delete] => :environment do |t, args|
		args.with_defaults(:delete => 'true')
		delete = args[:delete] == 'true'
		@amount = args[:amount].to_i

		Rake::Task["db:populate_users"].invoke(@amount)
		Rake::Task["db:populate_store_items"].invoke(@amount)
		Rake::Task["db:populate_games"].invoke(@amount)
		Rake::Task["db:populate_compos"].invoke(@amount)
		Rake::Task["db:populate_teams"].invoke(@amount)
		Rake::Task["db:populate_user_groups"].invoke(@amount)
    Rake::Task["db:populate_blog"].invoke(@amount)
	end
end
