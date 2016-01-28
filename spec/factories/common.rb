FactoryGirl.define do
  sequence(:email) { |n| "test_email_#{n}@zvlex.me" }

  factory :user do
    first_name 'Alexander'
    last_name 'Zutikov'
    email { generate(:email) }
    password 'secret'
    password_confirmation 'secret'
  end

  factory :post do
    title 'Post title'
    body 'Post body'
    user
  end

  factory :post_vote do
    user
    post
    rate 1
  end
end
