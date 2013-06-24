# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    body "This recipe made my mouth water and toes tingle"
    association :user
  end
end
