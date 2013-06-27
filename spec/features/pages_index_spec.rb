require 'spec_helper'

describe 'viewing the homepage' do

  it 'has a sign in field' do 
    visit root_path
    expect(page).to have_selector('div.user-nav')
  end

  it 'has a sign up button' do 
    visit root_path
    expect(page).to have_link('Sign up')
  end
end

 describe 'it has a navidation bar' do
  
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

