require 'spec_helper'

describe "pages/index" do
  describe 'it displayers sign up information if user is not logged in', :type => :feature do

    it 'has a sign in field' do 
      visit root_path
      expect(page).to have_selector('div.user-nav')
    end

    it 'has a sign up button' do 
      visit root_path
      expect(page).to have_link('Sign up')
    end
end

 describe 'It has a search form for users to search by recipe title' , :type => :feature do
  before :each do 
    visit root_path
  end

    it 'has a home button' do 
      expect(page).to have_link('Home')
    end

    it 'should have a browse recipe button' do 
      expect(page).to have_link('Browse')
    end

    it 'should have a categories link' do 
      expect(page).to have_link('categories')
    end
  end

  describe 'It allows the user to search' do
    let(:valid_user) { FactoryGirl.create(:user) }
    before :each do
      Recipe.create!(:title => 'Mothers Lasagna', :description => 'The best sauce ever')
      visit root_path
      sign_in_as valid_user
    end 

    it 'allows the user to input what they would like to search for' do 
      fill_in 'search-field', :with => 'lasagna'
      click_on 'search-button'
      expect(page).to have_content("Mothers Lasagna")
    end

    it 'checks to see if search brings you to the correct path' do
      fill_in 'search-field', :with => 'lasagna'
      click_on 'search-button'
      expect(current_path).to eql(recipes_path)
    end
  end

  describe 'homepage content' do
    before :each do
      FactoryGirl.create(:recipe) 
      visit root_path
    end

    it 'should have a recent recipe field' do 
      expect(page).to have_content('Recently Added')
    end

    it 'should have the last recipe created as content' do
      expect(page).to have_content('Lasagna')
    end
  end
end



