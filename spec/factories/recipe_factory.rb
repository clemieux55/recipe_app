FactoryGirl.define do 
	sequence(:title) { |n| "ti#{n}tle" }
	sequence(:description) { |n| "des#{n}ription" }

	factory :recipe do 
		title
		description
		user_id

		trait :user_id do 

			after(:save) do |recipe|
				FactoryGirl.create_list(:user, recipe: recipe)
			end
		end

		trait :with_comments do
			ignore do 
				comments_count 3
			end

			after(:save) do |recipe, evaluator|
				FactoryGirl.create_list(:comment, evaluator.comments_count, recipe: recipe)
			end
		end

		trait :with_ingredients do
			ignore do
				ingredients_count 3
			end

			after(:save) do |recipe, evaluator|
				FactoryGirl.create_list(:ingredient, evaluator.ingredients_count, recipe: recipe)
			end
		end


		factory :recipe_with_comments, traits: [:with_comments]
		factory :recipe_with_ingredients, traits: [:with_ingredients]
		factory :recipe_with_both, traits: [:with_comments, :with_ingredients]
	end
end

