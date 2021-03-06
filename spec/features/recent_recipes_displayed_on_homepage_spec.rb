require 'spec_helper'

describe 'homepage content' do
  let(:valid_user) { FactoryGirl.create(:user) }

  let!(:recipe1) { FactoryGirl.create(:recipe) }
  let!(:recipe2) { FactoryGirl.create(:recipe) }
  let!(:recipe3) { FactoryGirl.create(:recipe) }
  before :each do 
    visit root_path
    sign_in_as valid_user
  end


  it 'should have a recent recipe field' do
    expect(page).to have_content('Recent Recipes')
  end


  it 'should have the last three recipe titles created displayed' do 
    expect(page).to have_content(recipe1.title, recipe2.title, recipe3.title)
  end

  it 'should have the descriptions displayed for the recipe' do 
    expect(page).to have_content(recipe1.description, recipe2.description, recipe3.description)
  end
end



