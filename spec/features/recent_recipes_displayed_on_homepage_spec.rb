require 'spec_helper'

describe 'homepage content' do

  let(:valid_user) { FactoryGirl.create(:user) }
  
  before :each do 
    visit root_path
    sign_in_as valid_user
  end

  it 'should have a recent recipe field' do
    expect(page).to have_content('Recently Added')
  end

  it 'should have the last recipe created as content' do
    last_recipe_created
    expect(page).to have_content('Donut')
  end

  def last_recipe_created
    Ingredient.create(name: 'dough')
    visit root_path
    click_on 'Add Recipe'
    fill_in "recipe_title", with: 'Donut'
    fill_in 'recipe_description', with: 'Glazed Donut'
    select 'dough', from: 'Ingredients'
    click_on 'Create Recipe'
    root_path
  end
end



