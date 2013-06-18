require 'spec_helper'

describe 'Ingredients' do 

	before do 
		valid_user = FactoryGirl.build(:user)
		sign_in_as valid_user
		click_on 'Add Recipe'
		fill_in 'recipe_title', with: 'cherry pie'
		fill_in 'recipe_description', with: 'This pie is the bomb'
		click_button 'Create Recipe'
	end

	context 'Add ingredients to recipe' do 

		it 'Lets the user search through ingredients to add to their new recipe' do
			fill_in "q_name_cont", with: 'Cheese'
			click_on 'Search Ingredients'
			expect(page).to have_content('Ingredients you would like to add')
		end
	end
end