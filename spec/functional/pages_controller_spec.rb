require 'spec_helper'

describe RecipesController do

  describe "GET 'index'", :type => :feature do
    it 'has the selector ul.navbar-inner' do
      visit root_path
      page.should have_selector('button.btn.btn-success')
    end

    it 'should have the button home' do 
      visit root_path
      page.should have_content('Welcome')
    end
  end
end

