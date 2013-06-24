FactoryGirl.define do 
	factory :recipe do 
		title 'Lasagna'
		description 'It is wonderfully saucy'

		trait :with_comments do

			ignore do 
				comments_count 3
			end

			sequence(:comment) { |n| "com#{n}ment" }

			after(:save) do |recipe, evaluator|
				FactoryGirl.create_list(:comment, evaluator.comments_count, recipe: recipe)
			end
		end

		factory :recipe_with_comments, traits: [:with_comments]
	end
end
