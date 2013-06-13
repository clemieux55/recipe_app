# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
  	email 'clemieux598@gmail.com'
  	password 'chris666'
  	password_confirmation 'chris666'
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

