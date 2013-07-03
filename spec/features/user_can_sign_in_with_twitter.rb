require 'spec_helper'

feature "User can sign in with twitter", %q{
	As a user
	I want to option to sign in with twitter
	So I can use my twitter username

} do 

	# Acceptance Criteria
	# - I want a link to sign into twitter
	# - I want to be able to input my username and password


	scenario 'As a user, I can authenticate with my twitter information', focus: true do 
		visit root_path
		expect(page).to have_content('Login with Twitter')
	end