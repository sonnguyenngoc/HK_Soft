class BookingHotelsController < ApplicationController
  # POST /booking_hotels
  # POST /booking_hotels.json
  def create
    @booking_hotel = BookingHotel.new(booking_hotel_params)
    
    respond_to do |format|
      if @booking_hotel.save
        format.html { redirect_to hotel_thankyou_path }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking_hotel
      @booking_hotel = BookingHotel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def booking_hotel_params
      params.require(:booking_hotel).permit(:hotel_id, :full_name, :phone, :email, :address, :passport, :date_from, :date_to, :adult, :child, :room_number, :hotel_room_id, :hotel_room_name, :price, :message)
    end
end
