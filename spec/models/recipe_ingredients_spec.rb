require 'spec_helper'

describe RecipeIngredient do 

	it { should belong_to(:recipe) }
	it { should belong_to(:ingredient) }
	it { should have_valid(:unit).when('teaspoon','ts','tbs','cup','liter') }
	it { should have_valid(:value).when('7', '1/3') }

	it { should validate_presence_of(:value) }
	it { should validate_presence_of(:unit) }

	it 'should join value and unit together' do
		value = "2"
		unit = 'tablespoons'
		recipe_ingredient = RecipeIngredient.new( value: value, unit: unit)
		expect(recipe_ingredient.measurement).to eql("2 - tablespoons")

	end
end