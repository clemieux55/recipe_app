require 'spec_helper'

describe PagesController do
  describe "GET /'index'", :type => :feature do

  	it 'displays the homepage for the user' do
  		visit root_path
  		expect(page.status_code).to eql(200)
  	end

  	it 'check if the page has content welcome' do 
  		visit root_path
  		expect(page).to have_content('Welcome')
  	end

  end

end
