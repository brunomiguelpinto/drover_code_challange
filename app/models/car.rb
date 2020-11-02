class Car < ApplicationRecord
  include Filterable
  include Orderable
  belongs_to :maker
  belongs_to :model
  belongs_to :subscription

  validates :year, presence: true
  validates :color, presence: true
  validates :availability_date, presence: true

  self.per_page = 20

  scope :filter_by_maker, ->(maker) { joins(:maker).where('makers.name = ?', maker) }
  scope :filter_by_model, ->(model) { joins(:model).where('models.name = ?', model) }
  scope :filter_by_color, ->(color) { where color: color }
  scope :ordered_by_price, ->(order) { joins(:subscription).order("subscriptions.price #{order}") }
  scope :ordered_by_maker, ->(order) { joins(:maker).order("makers.name  #{order}") }
  scope :ordered_by_year, ->(order) { order("year  #{order}") }
  scope :ordered_by_availability, ->(order) { order("availability_date  #{order}") }
  scope :available, -> { where('availability_date < ?', Date.current + 3.months) }
end
