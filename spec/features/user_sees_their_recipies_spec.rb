require 'spec_helper'

feature "User can view the recipies they have created", %q{
	As a user
I want to view my recipies
To see them
} do 

# 	Acceptance Criteria
# - I want a link to view all recipies I have created
 
	
	let(:user) { FactoryGirl.create(:user) }
	let(:user2) { FactoryGirl.create(:user) }

	let!(:recipe) { FactoryGirl.create(:recipe_with_both, user: user) }
	let!(:recipe1) { FactoryGirl.create(:recipe_with_both, user: user) }
	let!(:recipe2) { FactoryGirl.create(:recipe_with_both, user: user2) }

	scenario "User sees all of their recipies" do
		sign_in_as user

		visit root_path

		click_on 'My Recipes'

		expect(page).to have_content recipe.title
		expect(page).to have_content recipe1.title
		expect(page).to_not have_content recipe2.title
	end
end

