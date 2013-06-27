require 'spec_helper'

feature "user sees comments for the recipe", %q{
  as a user
  i want to view the comments for the recipe
  so i know what recipe is good
} do

  # Acceptance Criteria
  # - I can view the comments with recipe instructions
  # - I can save the comments with a recipe

  let(:user) { FactoryGirl.create(:user) }  
  
  let(:recipe) { FactoryGirl.create(:recipe_with_both) }
  

  scenario "usersees all of the comments" do
    sign_in_as user

    visit recipe_path(recipe)

    recipe.comments.each do |comment|
      expect(page).to have_content comment.body
    end

  end
end