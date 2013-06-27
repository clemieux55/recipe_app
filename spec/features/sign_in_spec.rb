require 'spec_helper'

describe 'user log in' do 
  before :each do 
    visit root_path
  end

  let(:valid_user) { FactoryGirl.create(:user) }
    
  it 'allows the user to sign in' do
    fill_in 'user_email', :with => valid_user.email
    fill_in 'user_password', :with => valid_user.password
    click_on 'Log In'
    expect(page).to have_content 'Signed in successfully.'
  end

  it 'will not allow a user to sign in with an invalid email' do 
    fill_in 'user_email', :with => 'invalidemail@email.com'
    fill_in 'user_password',:with => 'invalid_password'
    click_on 'Log In'
    expect(page).to have_content 'Invalid email or password'
  end
end