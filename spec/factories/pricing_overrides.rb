# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
	factory :pricing_override do
		price "9.99"
		store_item
	end
end
