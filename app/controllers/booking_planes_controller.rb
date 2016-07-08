class BookingPlanesController < ApplicationController
  # POST /booking_planes
  # POST /booking_planes.json
  def create
    @booking_plane = BookingPlane.new(booking_plane_params)
    respond_to do |format|
      if @booking_plane.save
        format.html { redirect_to plane_ticket_thankyou_path }
      end
    end
  end
  
  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def booking_plane_params
      params.require(:booking_plane).permit(:full_name, :email, :phone, :address, :passport, :adult, :child, :seat_number, :date_from, :date_to, :ticket_type, :address_from, :address_to, :message)
    end
end
