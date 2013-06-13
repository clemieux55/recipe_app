require 'spec_helper'

describe User do 
	describe 'sign up link added to hompage' do 


		it 'adds the user if the validations are correct' do
			prev_count = User.count
			user = FactoryGirl.create(:user)
			expect(User.count).to eql(prev_count + 1)
		end

		it 'will not add a new user if email is invalid' do 
			user = FactoryGirl.build(:user, :email => '')
			expect(user.save).to be_false
		end

		it 'will not add a new user if password does not match me is invalid' do 
			user = FactoryGirl.build(:user, :password => 'invalid', :password_confirmation => 'veryvalid')
			expect(user.save).to be_false
		end

		it 'checks if user.find retrieves correct info' do
			user = FactoryGirl.create(:user)
			user_id = user.id
			expect(User.find(user_id).email).to eql('clemieux598@gmail.com')
		end
	end
end
