require 'spec_helper'

describe "User adds a recipe" do

	let(:valid_user) { FactoryGirl.create(:user) }
	
	before :each do 

		visit root_path

		sign_in_as valid_user

		click_on 'Add Recipe'
	end

	it 'will not allow the user to create recipe without a title' do
		fill_in 'recipe_title', :with => ''
		fill_in 'recipe_description', :with => 'Hope you like butter'
		click_on 'create_recipe'
		expect(page).to have_content('Please fill in appropriate fields')
		expect(current_path).to eql(recipes_path)
	end

#TODO: Find a way to refactor test to automatically click add recipe

	it 'will let the user select ingredients' do 
		fill_in 'recipe_title', :with => 'Erics Masterpiece'
		fill_in 'recipe_description', :with => 'Lots of sauce'
		click_on 'create_recipe'
		expect(page).to have_content('Recipe Successfully Created')
		expect(current_path).to eql(edit_recipe_path(Recipe.last))

	end

	it 'will let the user add three ingredients' do 
		fill_in 'recipe_title', :with => 'Lasagna'
		fill_in 'recipe_description', :with => 'Garfields Favorite'
		click_on 'create_recipe'
		expect(page).to have_content('Lasagna')
		expect(page).to have_content('Garfields Favorite')
		expect(current_path).to eql(edit_recipe_path(Recipe.last))
	end
end
