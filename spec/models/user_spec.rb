require 'spec_helper'

describe User do 
	
	context 'sign in' do 

		it 'Let user sign in with valid attributes' do
			user = FactoryGirl.build(:user, :email => 'chris666@gmail.com')
			expect(user.save).to be_true
		end

		it 'User can not sign in if password is invalid' do 
			user = FactoryGirl.build(:user, :password => 'not_correct')
			expect(user.save).to be_false
		end
	end
end