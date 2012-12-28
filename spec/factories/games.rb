# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
	factory :game do 
		download_location {Faker::Internet.url}
		info {Faker::Lorem.paragraph(2)}
		name {Faker::Game.name}
	end
end
