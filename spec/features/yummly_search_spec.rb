require 'spec_helper'

feature 'searching the yummly api', %q{
	As a user
	I want to input criteria into a search field
	So that i can search yummly for their recipes
} do 

	describe 'searching yummly' do

		before :each do 
			visit root_path
				fill_in 'yummly_yum', with: 'lasagna'
				VCR.use_cassette('yummly_response') do 
				Net::HTTP.get_response(URI("http://api.yummly.com/v1/api/recipes?_app_id=#{Yummly.app_id}&_app_key=#{Yummly.app_key}&q=lasagna"))
				click_on 'Yummlys'
			end
		end

		it 'lets the user input their search criteria' do 
			expect(page).to have_content('Yummly Search Results')
			expect(current_path).to eql(yummlys_path)
		end

		it 'lets the user view yummly results' do 
			recipes = ["World's Best Lasagna","White Cheese Chicken Lasagna","Slow Cooker Pesto Spinach Lasagna","Deep Dish Lasagna"]
			recipes.each do |recipe|
				expect(page).to have_link('Yummly!')
			end
		end

		it 'has a link to the recipe page on yummly' do 
			expect(page).to have_link('Yummly!')
			expect(page).to have_selector('img.recipe-image')
			expect(page).to have_selector('a.btn.btn-success')
		end

		it 'has a list of ingredients on the page for recipes' do 
			expect(page).to have_content('Ingredients:')
			expect(page).to have_content('tomato paste')
			expect(page).to have_content('egg')
			expect(page).to have_content('Spinach Lasagna III')
		end
	end
end



