require 'spec_helper'

describe "Viewing a recipe" do 

	let(:valid_user) { FactoryGirl.create(:user) }

	it 'will not let guest create recipe' do
		visit root_path
		click_on 'Add Recipe'
		page.should have_content('You need to sign in or sign up before continuing.')
	end

	it 'only allows registered users access to add recipes' do 
		visit root_path
		sign_in_as valid_user
		click_link 'Add Recipe'
		page.should have_content('Add Deliciousness')
	end
end

describe "Adding a recipe" do 
	describe 'allows registered users to add a recipe' do 
		let(:valid_user) { FactoryGirl.create(:user) }
		
		before :each do 
			visit root_path
			valid_user = FactoryGirl.build(:user)
			Ingredient.create(:name => 'Sauce')
			Ingredient.create(:name => 'Noodle')
			Ingredient.create(:name => 'Riccotta')
		end

		it 'will not allow the user to create recipe without a title' do
			sign_in_as valid_user
			click_on 'Add Recipe'
			fill_in 'recipe_title', :with => ''
			fill_in 'recipe_description', :with => 'Hope you like butter'
			click_on 'Create Recipe'
			page.should have_content('Please fill in appropriate fields')
		end

		it 'will let the user add a recipe if registered' do 
			sign_in_as valid_user
			click_on 'Add Recipe'
			fill_in 'recipe_title', :with => 'Lasagna'
			fill_in 'recipe_description', :with => 'Garfields FAvorite'
			select 'Sauce', :from => 'Ingredients'
			select 'Noodle', :from => 'Ingredients'
			select 'Riccotta', :from => 'Ingredients'
			click_on 'Create Recipe'

		end

		it 'will let the user select ingredients' do 
			sign_in_as valid_user
			click_on 'Add Recipe'
			fill_in 'recipe_title', :with => 'Erics Masterpiece'
			fill_in 'recipe_description', :with => 'Lots of sauce'
			select 'Sauce', :from => 'Ingredients'
			click_on 'Create Recipe'
			page.should have_content('Recipe Successfully Created Erics Masterpiece')
		end
	end
end
