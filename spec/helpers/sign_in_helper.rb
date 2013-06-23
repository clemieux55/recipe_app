module SignInHelper

	def sign_in_as
		User.new(:email => 'clemieux598@gmail.com', :password => 'chris666')
	end

	def sign_up_as
		User.create(:email => 'clemieux@gmail.com', :password => 'chris678', :password_confirmation => 'chris678')
	end

	def sign_in_invalid_credentials
		User.build(:email => 'bob@gmail.com', :password => 'bobopedic')

	end	


end