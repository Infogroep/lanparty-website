# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
	factory :user do
		sequence(:username) { |n| "#{Faker::Internet.user_name}#{n}" }
		sequence(:email) { |n| "#{n}#{Faker::Internet.email}" }
		password 'abc123'
		password_confirmation 'abc123'
	end
end
