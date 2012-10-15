# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
	factory :match_lose_link do |match_lose_link|
		match_lose_link.association :next_match, :factory => :match
		match_lose_link.association :match, :factory => :match
	end
end
