require 'spec_helper'

describe RecipeIngredient do 

	it { should belong_to(:recipe) }
	it { should belong_to(:ingredient) }




end