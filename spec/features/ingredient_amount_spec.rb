require 'spec_helper'

feature "User can select the amount for each ingredient", %q{
	As a User
	I want to select the amount of the ingredient
	So I can be specific with ingredients
} do 


	let(:user) { FactoryGirl.create(:user) }
	let(:recipe) { FactoryGirl.create(:recipe) }

	it 'lets the user choose the amount of an ingredient' do 

	end
end
