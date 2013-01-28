# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
	factory :blog_comment do
		content "MyText"
		post
		user
	end
end
