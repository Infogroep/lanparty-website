# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :pricing_default do
    name "MyString"
    description "MyText"
    rounding_precision "9.99"
    ratio 1.5
  end
end
