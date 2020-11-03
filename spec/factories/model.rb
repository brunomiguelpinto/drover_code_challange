FactoryBot.define do
  factory :model do
    name { Faker::Vehicle.model }
    maker
  end
end
