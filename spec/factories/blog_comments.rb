# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
	factory :blog_comment do
		content "MyText"
		post nil
		user nil
	end
end
