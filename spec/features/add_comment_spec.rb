require 'spec_helper'

feature "User can add a comment on recipe show page", %q{
	As a user
	I want to add comments to a recipe
	to let others know how the recipe is
} do

# - Acceptance Criteria
# I want to be able to input my comment on the recipe
# I want to be able to submit the comment



	let(:user) { FactoryGirl.create(:user) }
	let(:recipe) { FactoryGirl.create(:recipe_with_ingredients) }
	let(:comment) { FactoryGirl.create(:comment) }

	scenario "User has field to input a comment" do 
		sign_in_as user

		visit recipe_path(recipe)

		fill_in 'comment_body', with: comment.body
		click_on 'Add Comment'
		expect(page).to have_content comment.body
		expect(page).to have_content user.email
	end
end