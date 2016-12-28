FactoryGirl.define do
  factory :user, :class => "User" do
    first_name "Bruce"
    last_name "Willis"
    email {"#{first_name}@example.com"}
    password "dieHard"
    :role
  end

  factory :admin, :class => "User" do
    first_name "Harry"
    last_name "Potter"
    email {"#{first_name}@example.com"}
    password "Hedwig"
    role = 1
  end
end
