# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
	factory :game do 
		sequence(:name){|n| "MyString #{n}"}
		info "MyString "
		sequence(:download_location){|n| "MyString #{n}"}
	end
end
