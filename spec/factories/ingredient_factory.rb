FactoryGirl.define do
	sequence(:name) { |n| "ing#{n}redient" }
		
	factory :ingredient do
		name
	end
end