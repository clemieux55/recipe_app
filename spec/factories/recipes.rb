FactoryGirl.define do 
	factory :recipe do 
		title 'Lasagna'
		description 'It is wonderfully saucy'
	end
end


FactoryGirl.define do 
	sequence :title do |n|
		"recipe#{n}"
	end

	factory :many do 
		title
		description 'Best recipe ever'
	end
end