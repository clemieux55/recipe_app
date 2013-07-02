require 'spec_helper'

describe "User adds a recipe" do

	let(:valid_user) { FactoryGirl.create(:user) }
	
	before :each do 
		visit root_path

		sign_in_as valid_user

		Ingredient.create!(:name => ['Sauce', 'Noodle', 'Riccotta'])
		click_on 'Add Recipe'
	end

	it 'will not allow the user to create recipe without a title' do
		fill_in 'recipe_title', :with => ''
		fill_in 'recipe_description', :with => 'Hope you like butter'
		click_on 'Create Recipe'
		expect(page).to have_content('Please fill in appropriate fields')
	end

	it 'will allow the user to select an ingredient' do
		fill_in 'recipe_title', :with => 'Lasagna'
		fill_in 'recipe_description', :with => 'Garfields Favorite'
		select 'Noodle', :from => 'Ingredients'
		click_on 'Create Recipe'
		expect(page).to have_content("Garfields Favorite")
	end

#TODO: Find a way to refactor test to automatically click add recipe

	it 'will let the user select ingredients' do 
		fill_in 'recipe_title', :with => 'Erics Masterpiece'
		fill_in 'recipe_description', :with => 'Lots of sauce'
		select 'Sauce', :from => 'Ingredients'
		click_on 'Create Recipe'
		expect(page).to have_content('Recipe Successfully Created')
	end

	it 'will let the user add three ingredients' do 
		fill_in 'recipe_title', :with => 'Lasagna'
		fill_in 'recipe_description', :with => 'Garfields Favorite'
		select 'Noodle', :from => 'Ingredients'
		select 'Sauce', :from => 'Ingredients'
		select 'Riccotta', :from => 'Ingredients'
		click_on 'Create Recipe'
		expect(page).to have_content('Garfields Favorite', 'Lasagna')
		expect(page).to have_content('Noodle', 'Sauce', 'Riccotta')
	end
end

