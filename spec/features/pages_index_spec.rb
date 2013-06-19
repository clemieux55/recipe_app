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
end

  describe 'user log in' do 
    let(:valid_user) { FactoryGirl.build(:user) }
      
    it 'allows the user to sign in' do
      visit root_path
      sign_in_as valid_user
      page.should have_content 'Signed in successfully.'
    end

    it 'will not allow a user to sign in with an invalid email' do 
      visit root_path
      fill_in 'Email', :with => 'bob@gmail.com'
      fill_in 'Password', :with => 'bobopedic'
      click_on 'Log In'
      page.should have_content 'Invalid email or password'
    end
	end

  describe 'has link to get recipe index' , :type => :feature do
    it 'has a search recipe field' do
    visit root_path
    page.should have_content('Search')
  end
end



