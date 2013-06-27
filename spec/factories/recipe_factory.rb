FactoryGirl.define do 	
	factory :recipe do 
		title 'Lasagna'
		description 'It is wonderfully saucy'

		trait :with_comments
			ignore do 
				comments_count 3
			end

			after(:save) do |recipe, evaluator|
				FactoryGirl.create_list(:comment, evaluator.comments_count, recipe: recipe)
			end

		trait :with_ingredients
			ignore do
				ingredients_count 3
			end

			after(:save) do |recipe, evaluator|
				FactoryGirl.create_list(:ingredient, evaluator.ingredients_count, recipe: recipe)
			end

		factory :recipe_with_comments, traits: [:with_comments]
		factory :recipe_with_ingredients, traits: [:with_ingredients]
	end
end

