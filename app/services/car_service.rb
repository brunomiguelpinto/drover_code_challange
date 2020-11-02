class CarService

  def self.get_cars(params)
    puts params
    # default order is subscription price
    params[:sort_by] = 'price' if params[:sort_by].nil?

    @cars = Car.includes(:maker, :model, :subscription).available.page(params[:page])
    @cars = @cars.filtered(params.slice(:maker, :model, :color))
    @cars.ordered(params[:sort_by], params[:sort_order])
  end

  # create car
  def self.create_car(params)
    Car.create!(params)
  end

  # update car
  def self.update_car(car, params)
    #todo
  end
end
