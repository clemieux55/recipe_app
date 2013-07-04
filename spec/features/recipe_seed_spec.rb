require 'spec_helper'

describe 'RecipeSeeder' do 

	let(:recipe) { RecipeSeeder.new }

	it 'add three recipes to the database' do 
		prev_count = Recipe.count
		recipe.seed_database_with_recipes
		expect(Recipe.count).to eql(prev_count + 3)
	end

	it 'will not add recipes to the database if they are already there' do 
		prev_count = Recipe.count
		recipe.seed_database_with_recipes
		expect(prev_count).to eql(prev_count)
	end
end
