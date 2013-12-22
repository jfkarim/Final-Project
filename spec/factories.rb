require 'faker'

FactoryGirl.define do
  factory :user do
    artist_name Faker::Internet.user_name
    email Faker::Internet.email
    password Faker::Internet.password
  end
end