
FactoryGirl.define do 
	factory :recipe_ingredient, :class => 'RecipeIngredient' do
		association :recipe
		association :ingredient
		sequence(:value) { rand(25) }
		sequence(:unit) { |n| "tabl#{n}SPOON" }
	end
end
