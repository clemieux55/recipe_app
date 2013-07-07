require 'spec_helper'

feature 'searching the yummly api', %q{
	As a user
	I want to input criteria into a search field
	So that i can search yummly for their recipes
} do 




		describe 'searching yummly', focus: true do

			it 'has a input field to input search criteria' do 
				visit root_path
				expect(page).to have_content('Yummly search')
		end

		it 'returns recipes for the criteria inputted' do 
			visit root_path
			fill_in 'Yummly search', with: 'lasagna'
			click_on 'Search Yummly'
			expect(page).to have_content('lasagna')
	end
end 

