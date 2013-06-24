require 'spec_helper'

feature "user sees comments for the recipe", %q{
  as a user
  i want to view the comments for the recipe
  so i know what recipe is good
} do

  # Acceptance Criteria
  # - I can view the ingredients with recipe instructions
  # - I can save the ingredients used with a recipe

  let(:valid_user) { FactoryGirl.build(:user) }
  
  
  let(:recipe) do
    FactoryGirl.create(:recipe) do |recipe|
    3.times { recipe.comments.create(attributes_for(:comment)) }
    end
  end

  let(:comment1) { FactoryGirl.create(:comment) }
  let(:comment2) { FactoryGirl.create(:comment) }
  let(:comment3) { FactoryGirl.create(:comment) }


  scenario "user sees all of the comments" do
    sign_in_as valid_user
    visit recipe_path(recipe)

    expect(page).to have_content comment1.body
    expect(page).to have_content comment2.body
    expect(page).to have_content comment3.body
  end
end
