# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
	factory :match_score do
		match_id 1
		user_id 1
		score 1
		user
		match
	end
end
