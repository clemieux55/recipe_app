require 'spec_helper'

describe Ingredient do 

		it { should validate_presence_of(:name) }
		it { should have_many(:recipes) }
		it { should have_many(:recipe_ingredients) }

		it { should have_valid(:name).when('Chris', 'Stephen') }
		it { should_not have_valid(:name).when(nil, '') }

		it { should have_many(:recipes).through(:recipe_ingredients) }
		
end