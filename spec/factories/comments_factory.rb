FactoryGirl.define do 
	factory :comment, :class => 'Comment' do 
		body "This recipe even made my dogs mouth water"
		association :user
	end
end