require 'spec_helper'

feature 'It allows the user to see search results', %q{
  As a user
  I want to see the recipe title
  So i can click it and go to its directory
} do 


#- Acceptance Criteria
# - I want to see the recipe title and description
# - I want to have a way to go to the recipe to view


  let!(:user) { FactoryGirl.create(:user) }
  let!(:recipe) { FactoryGirl.create(:recipe, user: user) }
  let!(:recipe2) { FactoryGirl.create(:recipe, user: user) }

  before(:each) do 
    visit root_path
    sign_in_as user
    fill_in 'q[title_cont]', with: recipe.title
    click_on('Search')
  end

  scenario 'Displaying the search results' do 
    expect(current_path).to eql(recipes_path)
    expect(page).to have_content(recipe.title)
    expect(page).to have_content(recipe.description)
    expect(page).to have_link(recipe.title)
  end

  scenario 'search results will not display items not search for' do 
    expect(page).to_not have_content(recipe2.title)
    expect(page).to_not have_content(recipe2.description)
  end
end


