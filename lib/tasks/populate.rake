namespace :db do
	desc "populates the database"

	task :populate => :environment do
		require 'faker'
		@amount = 10

		User.delete_all
		puts "--------------"
		puts "Creating Users"
		puts "--------------"
		User.create(
			:username => "Enermis",
			:email => Faker::Internet.email,
			:password => "roeland1",
			:password_confirmation => "roeland1"
		)
		puts "created Enermis"
		@amount.times do
			password = Faker::Lorem.characters 10
			user = User.new(
				:username => Faker::Internet.user_name,
				:email => Faker::Internet.email,
				:password => password,
				:password_confirmation => password
			)
			if user.valid?
				user.save!
				puts "created user #{user.username}"
			else
				puts "tried to create user #{user.username} but failed"
			end
		end

		Item.delete_all
		Barcode.delete_all
		puts ""
		puts "--------------"
		puts "Creating Items"
		puts "--------------"
		@amount.times do
			item = Item.new(
				:name => Faker::Name.name,
				:buy_price => rand(100),
				:item_type => ['Drinks','Foods','Goodies','Etc'].sample
			)
			(1..3).to_a.sample.times do
				barcode = Barcode.new(
					:code => (0...10).map{ ('a'..'z').to_a[rand(26)] }.join
					)
				barcode.item = item
				barcode.save!
				puts "\tcreated barcode #{barcode.code}" 
			end
			if item.valid?
				item.save!
				puts "created item #{item.name}"
			else
				puts "tried to create item #{item.name} but failed"
			end
		end

		Game.delete_all
		Compo.delete_all
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
						compo.save!
						puts "\tcreated compo for game #{game.name}"
					else
						puts "\ttried to create for game #{game.name} but failed"
					end
				end
			else
				puts "tried to create game #{game.name} but failed"
			end
		end

	end
end
