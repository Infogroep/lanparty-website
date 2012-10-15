# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
	factory :item do 
		name "Apple Pie"
		buy_price 12
		item_type "food"
	end
end
