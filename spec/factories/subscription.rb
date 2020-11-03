FactoryBot.define do
  factory :subscription do
    name { Faker::Vehicle.model }
    price { Faker::Number.decimal(l_digits: 2) }
  end
end
