# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
	factory :barcode do 
		code "123456789"
		item
	end
end
