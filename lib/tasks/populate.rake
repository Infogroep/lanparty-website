namespace :db do
	desc "populates the database"

	task :populate => :environment do
		@amount = 10

		Rake::Task["db:populate_users"].invoke(@amount)
		Rake::Task["db:populate_store_items"].invoke(@amount)
		Rake::Task["db:populate_games"].invoke(@amount)
		Rake::Task["db:populate_compos"].invoke(@amount)
		Rake::Task["db:populate_teams"].invoke(@amount)
	end
end
