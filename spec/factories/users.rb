# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
  	email 'clemieux598@gmail.com'
  	password 'chris666'
  	password_confirmation 'chris666'
  	remember_me 'hello'

  end
end
