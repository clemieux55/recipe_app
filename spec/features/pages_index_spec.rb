require 'spec_helper'

describe "pages/index" do
  describe 'it displayers sign up information if user is not logged in', :type => :feature do
    it 'has a sign in field' do 
      visit root_path
      page.should have_selector('div.user-nav')
    end

    it 'has a sign up button' do 
      visit root_path
      page.should have_link('Sign up')
    end
  end

  describe 'has link to get recipe index' , :type => :feature do
      it 'has the selector ul.navbar-inner' do
      visit root_path
      page.should have_content('Search')
    end
  end

  describe 'user log in' do 
    before :each do 
      FactoryGirl.create(:user)
    end
      
    it 'allows the user to sign in' do
      visit root_path
  		fill_in 'Email', :with => 'clemieux598@gmail.com'
  		fill_in 'Password', :with => 'chris666'
  		click_on 'Log In'
      page.should have_content 'Signed in successfully.'
    end
	end
end



