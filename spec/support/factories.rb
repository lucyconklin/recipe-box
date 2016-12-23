FactoryGirl.define do
  factory :user, :class => "User" do
    first_name "Bruce"
    last_name "Willis"
    email {"#{first_name}@example.com"}
    password "dieHard"
    :role
  end
end
