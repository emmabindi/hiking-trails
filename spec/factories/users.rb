FactoryBot.define do
  factory :user do
    sequence :email do |n|
      "testuser#{n}@email.com"
    end

    password { "password" }
  end
end
