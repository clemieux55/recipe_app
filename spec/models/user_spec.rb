require 'spec_helper'

describe User do 
	let(:user) { FactoryGirl.build(:user) }
	
	it { should have_valid(:email).when('example@email.com') } 
	it { should_not have_valid(:email).when('bademail.com', nil, '') }

	it { should validate_presence_of(:password) }
	it { should validate_presence_of(:email) }

	it { should validate_presence_of(:password_confirmation) }
end