class BookingToursController < ApplicationController

  # POST /booking_tours
  # POST /booking_tours.json
  def create
    @booking_tour = BookingTour.new(booking_tour_params)
      if @booking_tour.save
        BookingTourMailer.booking_tour_email(@booking_tour).deliver_now
        redirect_to tour_thankyou_path
    end
      
      puts @booking_tour.errors.to_json
  end
  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def booking_tour_params
      params.require(:booking_tour).permit(:full_name, :address, :phone, :email, :passport, :tour_schedule_id, :adult, :child, :child_2, :child_3, :message, :tour_id)
    end
end