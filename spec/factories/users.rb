FactoryGirl.define do
  factory :user do |f|
    f.name "John"
    f.email "test@test.com"
    f.password "secret"
    f.password_confirmation "secret"
  end
end
