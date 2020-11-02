class CarSerializer < ActiveModel::Serializer
  has_one :maker
  has_one :model
  has_one :subscription
  attributes :id, :color, :year, :availability_date
end
