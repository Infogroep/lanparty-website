namespace :db do
	desc "populates the database with competitions"

	task :populate_compos, [:amount, :delete] => :environment do |t, args|
		args.with_defaults(:delete => 'true')
		delete = args[:delete] == 'true'
		amount = args[:amount].to_i

		games_to_build = [amount - Game.count, 0].min
		puts "creating #{games_to_build} aditional games"
		Rake::Task["db:populate_games"].invoke(games_to_build, 'false')
		puts "---------------"
		puts "Creating compos"
		puts "---------------"
		Compo.delete_all
		amount.times do
			compo = FactoryGirl.build("compo")
			compo.game = Game.all.sample
			puts "creating compo for game #{compo.game.name}"
			compo.save! if compo.valid?
		end
	end
end
