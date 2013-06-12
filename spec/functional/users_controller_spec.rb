require 'spec_helper'

describe UsersController do
	describe 'user controller index' do 

		it 'gives the index of user' do
			user_index = User.all
		end

		it 'checks if controller added user to database' do
			user = FactoryGirl.create(:user)
			user_id = user.id
			expect(User.find(user_id).email).to eql('clemieux598@gmail.com')
		end
	end
end




