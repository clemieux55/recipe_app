require 'spec_helper'

describe RecipesController do

  describe "GET 'index'" do
    it 'has the selector ul.navbar-inner' do
      visit root_path
      page.should have_selector('ul.navbar-inner')
    end

    it 'should have the button home' do 
      visit root_path
      page.should have_button('Home')

    end
  end
end

