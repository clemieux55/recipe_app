# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :recipe_ingredient, :class => 'RecipeIngredients' do
    recipe_id 1
    ingredient_id 1
  end
end
