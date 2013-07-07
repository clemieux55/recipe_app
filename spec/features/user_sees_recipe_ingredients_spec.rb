require 'spec_helper'

feature "user sees recipe ingredients", %q{
  as a user
  i want to view the ingredients for the recipe
  so i know what ingredients i need
} do

  # Acceptance Criteria
  # - I can view the ingredients with recipe instructions
  # - I can save the ingredients used with a recipe

  let(:user) { FactoryGirl.create(:user) }
  let(:recipe) { FactoryGirl.create(:recipe_with_ingredients, user: user) }
  let!(:recipe_ingredient) { FactoryGirl.create(:recipe_ingredient, recipe: recipe) }

  before :each do
    sign_in_as user
  end

  scenario 'User can view ingredients for a recipe' do 
    visit recipe_path(recipe)
    expect(page).to have_content('Ingredients')
    expect(page).to have_content(recipe_ingredient.value)
    expect(page).to have_content(recipe_ingredient.unit)
    expect(page).to have_content(recipe_ingredient.ingredient.name)
  end
end