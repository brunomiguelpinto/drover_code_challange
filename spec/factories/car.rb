FactoryBot.define do
  factory :car do
    maker
    model
    subscription
    color { Faker::Vehicle.color }
    year { Faker::Vehicle.year }
    availability_date { Faker::Date.forward(days: 60) }
  end
end
