# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
	factory :store_item do 
		name "Apple Pie"
		buy_price 12
		store_item_type "food"
	end
end
