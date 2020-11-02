class Model < ApplicationRecord
  belongs_to :maker
  has_many :cars

  validates :name, presence: true
end