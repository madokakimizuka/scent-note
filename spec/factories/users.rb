FactoryBot.define do
  factory :user do
    name { 'user_a' }
    email { 'aaa@example.com' }
    admin { true }
    password { 'password' }
  end
end
