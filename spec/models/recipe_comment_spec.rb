require 'spec_helper'

describe RecipeComment do

	it { should have_many(:recipes) }
	it { should have_many(:comments) }

	it { should belong_to(:recipe) }
	it { should belong_to(:user) }



end
