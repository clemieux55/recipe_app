require 'spec_helper'

 describe 'it has a navidation bar' do
  
  before :each do 
    visit root_path
  end

  it 'has a home button' do 
    expect(page).to have_link('Home')
  end

  it 'should have a add recipe button' do 
    expect(page).to have_link('Add Recipe')
  end

  it 'should not show my recipes if user is guest' do 
  	expect(page).to_not have_content('My Recipes')
  end
end


	