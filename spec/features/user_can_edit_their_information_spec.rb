require 'spec_helper'

feature "user can see link to edit their information", %q{
	as a user
	i want to edit my information
	to change the fields
	} do 

# Acceptance Criteria
# - User needs a link to edit their information
# - I can click the link to go to a edit user page
# - I can edit my email, password at this page

let(:user) { FactoryGirl.create(:user) }

scenario "user has link to edit information" do 
	visit root_path

	sign_in_as user

	click_on 'Edit Information'
	expect(current_path).to eql(edit_user_registration_path)
	expect(page).to have_content('Email')
	expect(page).to have_content('Password')
	expect(page).to have_content('Password confirmation')
	expect(page).to have_content('Current password')

	end
end	