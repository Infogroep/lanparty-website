# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
	factory :store_item do 
		name "Apple Pie"
		purchase_price 12
    stock 5
	end
end
