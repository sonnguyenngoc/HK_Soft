class BookingCarsController < ApplicationController
  # POST /booking_cars
  # POST /booking_cars.json
  def create
    @booking_car = BookingCar.new(booking_car_params)
    
    respond_to do |format|
      if @booking_car.save
        format.html { redirect_to car_thankyou_path(booking_car_id: @booking_car) }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking_car
      @booking_car = BookingCar.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def booking_car_params
      params.require(:booking_car).permit(:full_name, :address, :phone, :email, :date_from, :date_to, :address_from, :address_to)
    end
end
