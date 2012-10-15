# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
	factory :match_win_link do |match_win_link|
		match_win_link.association :next_match, :factory => :match
		match_win_link.association :match, :factory => :match
	end
end
