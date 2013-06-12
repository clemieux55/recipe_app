require 'spec_helper'

describe PagesController do
  describe "GET 'index'", :type => :feature do
  	before :each do 
  		visit root_path
  	end

  	it 'displays the homepage for the user' do
  		expect(page.status_code).to eql(200)
  	end



  end
end
