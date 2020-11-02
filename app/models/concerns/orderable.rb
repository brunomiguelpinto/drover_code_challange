module Orderable
  extend ActiveSupport::Concern

  module ClassMethods
    def ordered(sort_by, order)
      order = 'asc' if order.nil?
      results = where(nil)
      results.public_send("ordered_by_#{sort_by}", order)
    rescue NoMethodError
      where(nil)
    end
  end
end
