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

  describe 'It has a search form for users to search by recipe title' , :type => :feature do

   
    it 'has a home button' do 
      visit root_path
      page.should have_link('Home')
    end

    it 'should have a browse recipe button' do 
      visit root_path
      page.should have_link('Browse')
    end

    it 'should have a categories link' do 
      visit root_path
      page.should have_link('categories')
    end
  end

  describe 'It allows the user to search' do
    before :each do
      Recipe.create(:title => 'Mothers Lasagna', :description => 'The best sauce ever')
    end 

    it 'allows the user to input what they would like to search for' do 
      visit root_path
      fill_in 'search-field', :with => 'lasagna'
      click_on 'search-button'
      page.should have_content('Mothers Lasagna')
    end

    it 'checks to see if search brings you to the correct path' do
      visit root_path
      fill_in 'search-field', :with => 'lasagna'
      click_on 'search-button'
      expect(current_path).to eql(recipes_path)
    end

    it 'will not allow a search if nothing is inputted by the user' do 
      visit root_path
      fill_in 'search-field', :with => ''
      click_on 'search-button'
      page.should have_content('You need to enter something to be able to search!')
    end
  end

  describe 'homepage content' do 
    let(:recipies) { FactoryGirl.create(:many) }

    it 'should have a recent recipe field' do 
      visit root_path
      page.should have_content('Recently Added')
    end

    it 'should have the last recipe created as content' do
      recipies
      visit root_path
      page.should have_content('recipies.title')
    end
  end
end



