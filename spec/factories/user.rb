FactoryBot.define do
  factory :user do
    id { 1 }
    email { 'user@test.com' }
    password  { '123123' }
  end
end
