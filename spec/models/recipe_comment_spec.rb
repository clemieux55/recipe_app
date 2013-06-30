require 'spec_helper'

describe RecipeComment do

	it { should have_one(:recipe_id) }
	it { should have_one(:comment_id) }

	it { should have_one(:recipe) }
	it { should have_one(:user) }



end
