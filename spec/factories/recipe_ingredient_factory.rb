
FactoryGirl.define do 
	factory :recipe_ingredient, :class => 'RecipeIngredient' do
		association :recipe
		association :ingredient
	end
end
