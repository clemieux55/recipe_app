require 'spec_helper'

describe "Recipe" do 
	describe "GET /recipes" do 
		it "has a link to add a recipe" do 
			visit root_path
			page.should have_link('Add Recipe')
		end

		it 'will only let a registered user add a recipe' do
			visit root_path
			click_on 'Add Recipe'
			page.should have_content('You must register to create a recipe')
		end

		it 'allows register user access add recipe form' do 
			user = FactoryGirl.build(:user)
			visit root_path
			fill_in 'Email', :with => user.email
			fill_in 'Password', :with => user.password
			click_on 'Add Recipe'
			page.should have_content('Add a recipe!')
		end
	end

	describe "POST /recipes" do 
		recipe = FactoryGirl.build(:recipe)
		it 'has a field for title' do 
			visit new_recipe_path
			fill_in 'Title', :with => recipe.title
			fill_in 'Description', :with => recipe.description 
			click_button 'Add Recipe'
			page.should have_content("#{recipe.title} successfully created!")
		end
	end
end


