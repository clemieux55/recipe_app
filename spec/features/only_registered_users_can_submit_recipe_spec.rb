require 'spec_helper'

describe "Viewing a recipe" do 

	let(:valid_user) { FactoryGirl.create(:user) }

	it 'will not let guest create recipe' do
		visit root_path
		click_on 'Add Recipe'
		expect(page).to have_content('You need to sign in or sign up before continuing.')
	end

	it 'only allows registered users access to add recipes' do 
		visit root_path
		sign_in_as valid_user
		click_link 'Add Recipe'
		expect(page).to have_content('Add Deliciousness')
	end
end

