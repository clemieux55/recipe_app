require 'spec_helper'

describe Comment do 

	it { should have_valid(:body).when('This is one of the most amazing recipies') }
	it { should_not have_valid(:body).when("") }

	it { should belong_to(:user) }
	it { should belong_to(:recipe) }
end
