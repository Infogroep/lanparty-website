# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
	factory :compo do
		description {Faker::Lorem.paragraph(2)}
		slots {rand(10)+1}
		date_time {rand(5000).hours.ago}
		group_size {rand(5)+1}
	end
end
