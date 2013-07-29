FactoryGirl.define do
  factory :user do
    name     "Michael"
    email    "m@g.com"
    password "foobar"
    password_confirmation "foobar"
  end
end