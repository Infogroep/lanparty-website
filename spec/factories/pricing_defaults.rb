# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :pricing_default do
    name "MyString"
    description "MyText"
    transform "cprice"
  end
end
