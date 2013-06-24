# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :recipe_ingredient, :class => 'RecipeIngredients' do
    association :recipe
    association :ingredient
  end
end
