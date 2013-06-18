require 'spec_helper'

describe "Recipe" do 
	describe "GET /recipes" do 

		it 'will not let guest create recipe' do
			visit root_path
			click_on 'Add Recipe'
			page.should have_content('You must register to create recipe!')
		end

		it 'only allows registered users access to add recipes' do 
			visit root_path
			user = FactoryGirl.build(:user)
			fill_in 'Email', :with => user.email
			fill_in 'Password', :with => user.password
			click_on 'Log In'
			click_link 'Add Recipe'
			page.should have_content('Add Delishishness')
		end
	end
end

describe "POST /recipe" do 
	describe 'allows registered users to add a recipe' do 
		before :each do 
			visit root_path
			user = FactoryGirl.build(:user)
			fill_in 'Email', :with => user.email
			fill_in 'Password', :with => user.password
			click_on 'Log In'
		end

		it 'will not allow the user to create recipe without a title' do 
			click_on 'Add Recipe'
			fill_in 'recipe_title', :with => ''
			fill_in 'recipe_description', :with => 'Hope you like butter'
			click_on 'Create Recipe'
			page.should have_content('Please fill in appropriate fields')
		end

		it 'will let the user add a recipe if registered' do 
			click_on 'Add Recipe'
			fill_in 'recipe_title', :with => 'Lasagna'
			fill_in 'recipe_description', :with => 'Garfields FAvorite'
			click_on 'Create Recipe'
			page.should have_content('Now choose the ingredients')
		end
	end
end
