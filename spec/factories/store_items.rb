# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
	factory :store_item do 
		name {Faker::Internet.user_name}
		purchase_price {rand(100)}
		stock {rand(50)}
	end
end
