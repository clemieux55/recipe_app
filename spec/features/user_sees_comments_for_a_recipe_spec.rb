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
  
  let(:recipe) do 
    FactoryGirl.create(:recipe) do |recipe|
      3.times { recipe.comments.create(attributes_for(:comment)) }
    end
  end

  let(:comment1) { recipe.comments[0] }
  let(:comment2) { recipe.comments[1] }
  let(:comment3) { recipe.comments[2] }

  scenario "usersees all of the comments" do
    sign_in_as user

    visit recipe_path(recipe)

    expect(page).to have_content comment1.body
    expect(page).to have_content comment2.body
    expect(page).to have_content comment3.body
  end
end