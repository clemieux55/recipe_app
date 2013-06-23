require 'spec_helper'

describe 'Comments' do 
	let(:valid_user) { FactoryGirl.create(:user) }
	before :each do 
		FactoryGirl.create(:recipe)
	end
		
		it 'has a link so registered users can post a comment' do 
			sign_in_as valid_user
			visit root_path
			fill_in 'search-field', :with => 'lasagna'
			click_on 'search-button'
			click_on 'Lasagna'
			expect(page).to have_content('Comment')
		end

		it 'has a text area so that users can type their comments' do
		end

		it 'has a way to edit comments if the user chooses' do 
		end

		it 'has a way for the user to delete the comments if they choose' do 
		end

		it 'loads the comments when the recipe selected is loaded' do
		end

	end