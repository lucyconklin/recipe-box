FactoryGirl.define do
  factory :user do
    first_name
    last_name
    email {"#{first_name}@example.com"}
    password_digest
    role
  end

  sequence :name do |n|
    "#{n}"
  end
end
