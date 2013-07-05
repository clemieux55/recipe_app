require 'spec_helper'

describe 'viewing the homepage' do

  it 'has a sign in field' do 
    visit root_path
    expect(page).to have_selector('div.user-nav')
  end

  it 'has a sign up button' do 
    visit root_path
    expect(page).to have_link('Sign Up')
  end
end

