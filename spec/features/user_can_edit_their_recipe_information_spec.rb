require 'spec_helper'

feature "A user can specify a value for the ingredient", %q{
	As a user
	I want to specify the value of the ingredient
	To let people know the amount of an ingredient
} do 

	let(:user) { FactoryGirl.create(:user) }
	let(:recipe) { FactoryGirl.create(:recipe) }
	let!(:ingredients) { IngredientSeeder.new.seed_database_with_ingredients }

	before(:each) do 
		sign_in_as user
	end

#TODO - Test javascript drop down box

	scenario 'Lets the user add the ingredient title and' do 
		visit edit_recipe_path(recipe)
		expect(page).to have_content("Ingredients :")
		expect(page).to have_content('Value')
		expect(page).to have_content('Unit')
	end
end
