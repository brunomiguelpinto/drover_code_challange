FactoryBot.define do
  factory :maker do
    name { Faker::Vehicle.manufacture }
  end
end
