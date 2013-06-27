module SignInHelper

	def sign_in_as(user)
		fill_in 'user_email', with: user.email
		fill_in 'user_password', with: user.password
		click_on 'Log In'
	end		

	def sign_up_as
		User.new(:email => 'clemieux@gmail.com', :password => 'chris678', :password_confirmation => 'chris678')
	end

	def sign_in_invalid_credentials
		User.build(:email => 'bob@gmail.com', :password => 'bobopedic')

	end	


end