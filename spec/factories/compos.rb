# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :compo do
    info "MyString"
    slots 1
    date "2012-10-08"
    group_size 1
  end
end
