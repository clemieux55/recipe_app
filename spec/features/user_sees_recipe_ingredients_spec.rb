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
  
  # let(:recipe) do 
  #   binding.pry
  #   FactoryGirl.create(:recipe) do |recipe|
  #     3.times { recipe.ingredients.create(attributes_for(:ingredient)) }
  #   end
  # end

  let(:ingredient1) { FactoryGirl.create(:ingredient) }
  let(:ingredient2) { FactoryGirl.create(:ingredient) }
  let(:ingredient3) { FactoryGirl.create(:ingredient) }
  let(:recipe) { FactoryGirl.create(:recipe, ingredients: [ingredient1, ingredient2, ingredient3])}
  
  scenario "user sees all of the ingredients" do
    sign_in_as user
    visit recipe_path(recipe)

    expect(page).to have_content ingredient1.name
    expect(page).to have_content ingredient2.name
    expect(page).to have_content ingredient1.name

  end 
end