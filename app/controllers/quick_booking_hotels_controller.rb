class QuickBookingHotelsController < ApplicationController
  # POST /quick_booking_hotels
  # POST /quick_booking_hotels.json
  def create
    @quick_booking_hotel = QuickBookingHotel.new(quick_booking_hotel_params)

    respond_to do |format|
      if @quick_booking_hotel.save
        format.html { redirect_to quick_hotel_thankyou_path }
      end
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def quick_booking_hotel_params
      params.require(:quick_booking_hotel).permit(:name, :phone, :email, :passport, :hotel_name, :location, :date_from, :date_to, :number, :adult, :child, :message)
    end
end
