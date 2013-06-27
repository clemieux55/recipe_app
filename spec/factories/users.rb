# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
  	email 'password_is_password@email.com'
  	password 'password'
  	password_confirmation 'password'
  end
end


FactoryGirl.define do 
	sequence(:random_password) {|n| n = rand(100), "#{LoremIpsum.generate}#{n}" }
	factory :many_users do
		email { EmailGenerator.generate }
		password { generate(:random_password) }
		password_confirmation "#{:random_password}"
		remember_me "No way"
	end
end

