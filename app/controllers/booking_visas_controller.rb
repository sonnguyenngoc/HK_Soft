class BookingVisasController < ApplicationController

  # POST /booking_visas
  # POST /booking_visas.json
  def create
    @booking_visa = BookingVisa.new(booking_visa_params)

    respond_to do |format|
      if @booking_visa.save
        BookingVisaMailer.booking_visa_email(@booking_visa).deliver_now
        format.html { redirect_to visa_card_thankyou_path }
      end
    end
  end
  
  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def booking_visa_params
      params.require(:booking_visa).permit(:full_name, :email, :phone, :address, :passport, :cmnd_number, :date_of_issue, :place_of_issue, :country_to, :visa_type, :message)
    end
end
