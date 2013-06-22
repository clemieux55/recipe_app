require 'spec_helper'

describe 'user log in' do 
  let(:valid_user) { FactoryGirl.create(:user) }
    
  it 'allows the user to sign in' do
    visit root_path
    fill_in 'Email', :with => valid_user.email
    fill_in 'Password', :with => valid_user.password
    click_on 'Log In'
    page.should have_content 'Signed in successfully.'
  end

  it 'will not allow a user to sign in with an invalid email' do 
    visit root_path
    fill_in 'Email', :with => 'invalidemail@email.com'
    fill_in 'Password',:with => 'invalid_password'
    click_on 'Log In'
    page.should have_content 'Invalid email or password'
  end
end