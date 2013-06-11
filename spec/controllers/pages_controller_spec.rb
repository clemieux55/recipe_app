require 'spec_helper'

describe PagesController do
  describe "GET 'index'", :type => :feature do
  	before :each do 
  		visit pages_index_path
  	end

  	it 'displays the homepage for the user' do
  		expect(page.status_code).to eql(200)
  	end

  	it 'checks if index page has content welcome' do
  		page.should have_content('Welcome')

  	end

  end
end
