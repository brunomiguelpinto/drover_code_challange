module Api
  module V1
    class CarsController < ApplicationController
      before_action :set_car, only: %i[show update destroy]

      # GET /api/v1/cars
      def index
        render json: CarService.get_cars(params)
      end

      # GET /api/v1/cars/1
      def show
        render json: @car
      end

      # POST /api/v1/cars
      def create
        @car = Car.new(car_params)

        if @car.save
          render json: @car, status: :created
        else
          render json: @car.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /api/v1/cars/1
      def update
        if @car.update(car_params)
          render json: @car
        else
          render json: @car.errors, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/cars/1
      def destroy
        @car.destroy
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_car
        @car = Car.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def car_params
        params.require(:car).permit(:color, :year, :availability_date, :maker_id, :model_id, :subscription_id)
      end
    end
  end
end
