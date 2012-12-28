# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
	factory :barcode do 
		code {rand(1000000000)}
	end
end
