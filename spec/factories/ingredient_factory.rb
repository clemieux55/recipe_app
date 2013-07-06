FactoryGirl.define do
	
		
	factory :ingredient do
		sequence(:name) { |n| "ing#{n}redient" }
	end
end