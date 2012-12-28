namespace :db do
	desc "populates the database"

	task :populate => :environment do
		require 'lanparty_faker'
		@amount = 10

		Rake::Task["populate_users"].invoke(@amount)
		Rake::Task["populate_store_items"].invoke(@amount)

		Game.delete_all
		Compo.delete_all
		Team.delete_all
		puts ""
		puts "--------------"
		puts "Creating Games"
		puts "--------------"
		@amount.times do
			game = Game.new(
				:download_location => Faker::Internet.url,
				:info => Faker::Lorem.paragraph,
				:name => Faker::Game.name
			)
			if game.valid?
				game.save!
				puts "created game #{game.name}"
				(1..3).to_a.sample.times do
					compo = Compo.new(
						:date_time => (1..5000).to_a.sample.hours.ago,
						:slots => rand(10),
						:info => Faker::Lorem.paragraph,
						:group_size => rand(5),
						:game_id => game.id
					)
					if compo.valid?
						compo.save
						puts "\tcreated compo for game #{game.name}"
						rand(@amount).times do
							team = Team.new(
								:name => Faker::Name.name,
								:compo_id => compo.id
							)
							if team.valid?
								team.save
								puts "\t\tCreating team #{team.name} for #{compo.game.name}"
							else
								puts "\t\ttried to create team #{team.name} for #{compo.game.name} but failed"
							end
						end
					else
						puts "\ttried to create game #{game.name} but failed"
					end
				end
			else
				puts "tried to create game #{game.name} but failed"
			end
		end

		puts ""
		puts "--------------"
		puts "populate teams"
		puts "--------------"
		Team.all.each do |team|
			rand(team.compo.group_size+1).times do
				user = User.all.sample
				if not team.users.include? user
					team.users << user
					puts "adding #{user.username} to team #{team.name} for #{team.compo.game.name}"
				end
			end
		end

	end
end
