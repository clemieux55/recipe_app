require 'spec_helper'

feature 'searching the yummly api', %q{
	As a user
	I want to input criteria into a search field
	So that i can search yummly for their recipes
} do 

	describe 'searching yummly' do

		it 'has a input field to input search criteria' do 
			visit root_path
			expect(page).to have_content('Yummly')
		end
	end
end





# class VCRTest < Test::Unit::TestCase
#   def test_example_dot_com
#     VCR.use_cassette('yummly_response') do
#       response = Net::HTTP.get_response(URI("http://api.yummly.com/v1/api/recipes?_app_id=#{Yummly.new.app_id}&_app_key=#{Yummly.new.app_key}&q=lasagna"))
#       assert_match /Example Domains/, response.body
#     end
#   end
# end