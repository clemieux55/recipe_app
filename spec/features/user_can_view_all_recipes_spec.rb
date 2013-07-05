require 'spec_helper'

feature "User can click on an All Recipes and view all the recipes created", %q{
	As a User
	I want to view all the recipes
	To select one to view
}do

	# User can navigate to homepage
	# - user can click on all recipes 
	# - User is brought to the all recipes page
	# - User can see ten recipes per page

	let(:user) { FactoryGirl.create(:user) }

	scenario 'User can view all the recipes' , focus: true  do 
		visit root_path
		sign_in_as user
		expect(page).to have_link 'All Recipes'
	end

	scenario 'Click on all recipes brings you to the correct path', focus: true  do 
		visit root_path
		sign_in_as user
		click_on 'All Recipes'
		expect(current_path).to eql(recipes_path)
	end
end