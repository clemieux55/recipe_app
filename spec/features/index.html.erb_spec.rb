require 'spec_helper'

describe "pages/index.html.erb" do
  describe 'it displayers sign up information is user is not logged in', :type => :feature do
  	
  	it 'has a sign up field for email' do 
  		visit pages_index_path
  		fill_in 'Email', :with => 'clemieux598@gmail.com'
  		fill_in 'Password', :with => 'christopher'
  		click_button 'Log In'

		end
	end
end
