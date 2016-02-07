FactoryGirl.define do
  sequence(:email) { |n| "test_email_#{n}@zvlex.me" }

  factory :user do
    first_name 'Alexander'
    last_name 'Zutikov'
    email { generate(:email) }
    password 'secret'
    password_confirmation 'secret'
  end

  factory :post_version do
    user
    title 'Lorem Ipsum'
    body 'The standard Lorem Ipsum'

    factory :on_moderation_post_version do
      aasm_state 'on_moderation'
    end

    factory :approved_post_version do
      aasm_state 'approved'
    end

    factory :declined_post_version do
      aasm_state 'declined'
    end
  end

  factory :post do
    user
    post_version
  end

  factory :post_vote do
    user
    post
    rate 1
  end
end
