FactoryBot.define do
  factory :trail do
    sequence :name do |n|
      "Factory Test Trail no.#{n}"
    end
    distance {100}
    difficulty {3}

    trait :invalid do 
      name {nil}
    end
  end
end