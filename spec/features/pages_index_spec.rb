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
    let(:valid_user) { FactoryGirl.create(:user) }
    before :each do
      Recipe.create!(:title => 'Mothers Lasagna', :description => 'The best sauce ever')
    end 

    it 'allows the user to input what they would like to search for' do 
      visit root_path
      sign_in_as valid_user
      fill_in 'search-field', :with => 'lasagna'
      click_on 'search-button'
      expect(page).to have_content("Mothers Lasagna")
    end

    it 'checks to see if search brings you to the correct path' do
      visit root_path
      sign_in_as valid_user
      fill_in 'search-field', :with => 'lasagna'
      click_on 'search-button'
      expect(current_path).to eql(recipes_path)
    end
  end

  describe 'homepage content' do 

    it 'should have a recent recipe field' do 
      visit root_path
      page.should have_content('Recently Added')
    end

    it 'should have the last recipe created as content' do
      recipe = FactoryGirl.create(:recipe)
      visit root_path
      page.should have_content(recipe.title)
    end
  end
end



