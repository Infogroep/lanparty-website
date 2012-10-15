# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
	factory :price do
		info "MyString"
		value 1.5
		sponsor "MyString"
	end
end
