namespace :db do
	desc "populates the database with games"

	task :populate_games, [:amount, :delete] => :environment do |t, args|
		args.with_defaults(:delete => 'true')
		delete = args[:delete] == 'true'
		require 'lanparty_faker'
		amount = args[:amount].to_i
		puts "--------------"
		puts "Creating Games"
		puts "--------------"

		Game.delete_all if delete
		amount.times do
			tries = 0
			game = false
			while not game and tries < 10
				x = FactoryGirl.build("game")
				tries += 1
				if x.valid?
					game = x
				end
			end
			if game
				game.save!
				puts "creating #{game.name}"
			else
				puts "failed creating game after #{tries} tries"
			end
		end
	end
end
