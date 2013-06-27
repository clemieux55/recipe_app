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


  
  let(:recipe) do
    FactoryGirl.create(:recipe) do |recipe|
      3.times { recipe.ingredients.create(attributes_for(:ingredient)) }
    end
  end

  let(:ingredient1) { recipe.ingredients[0] }
  let(:ingredient2) { recipe.ingredients[1] }
  let(:ingredient3) { recipe.ingredients[2] }


  scenario "user sees all of the ingredients" do
    sign_in_as user

    visit recipe_path(recipe)

    expect(page).to have_content ingredient1.name
    expect(page).to have_content ingredient2.name
    expect(page).to have_content ingredient3.name
  end
end