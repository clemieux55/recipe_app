require 'spec_helper'

feature "Tweet a recipe", %q{
	As a user
	I want to click a button
	To tweet the recipe im on
} do 

	# Acceptance Criteria
	# - I can click a link on the recipe im viewing to tweet this recipe

	let(:user) { FactoryGirl.create(:user) }
	let!(:recipe) { FactoryGirl.create(:recipe_with_ingredients) }

	before :each do 
		visit root_path
		sign_in_as user
	end

	scenario 'Tweeting about a recipe' do 
		visit recipe_path(recipe)
		expect(page).to have_content('Tweet this recipe!')
	end
end