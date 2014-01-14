# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :visitor do
    ip "MyString"
    visits 1
    mobile false
  end
end
