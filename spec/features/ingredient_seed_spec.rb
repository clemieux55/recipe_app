require 'spec_helper'


describe 'IngredientSeeder' do 
	let(:ingredients) { IngredientSeeder.new}

	it 'Seeds the database with ingredients' do 
		result = ingredients.seed_database_with_ingredients
		expect(result.count).to eql(961)
	end

	it 'includes desired ingredients' do 
		result = ingredients.seed_database_with_ingredients
		expect(result).to include("7-Up")
		expect(result).to include("rice - long grain converted")
	end

	it 'will not seed the database if the ingredients have already been seeded' do 
		ingredients.seed_database_with_ingredients
		result = ingredients.seed_database_with_ingredients
		expect(Ingredient.count).to eql(961)
	end
end