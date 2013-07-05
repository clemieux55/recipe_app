require 'spec_helper'

describe RecipeIngredient do 

	it { should belong_to(:recipe) }
	it { should belong_to(:ingredient) }
	it { should have_valid(:unit).when('teaspoon','ts','tbs','cup','liter') }
	it { should have_valid(:value).when('7', '1/3') }

end