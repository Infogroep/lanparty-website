FactoryGirl.define do
  factory :item do
    name "Apple Pie"
    buy_price 12
    item_type "food"
  end

  factory :barcode do
    code "1234567890"
    item
  end
end
