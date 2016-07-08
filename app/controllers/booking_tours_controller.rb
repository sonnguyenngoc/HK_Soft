class BookingToursController < ApplicationController

  # POST /booking_tours
  # POST /booking_tours.json
  def create
    @booking_tour = BookingTour.new(booking_tour_params)
    respond_to do |format|
      if @booking_tour.save
        format.html { redirect_to tour_thankyou_path }
      end
    end
  end
  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def booking_tour_params
      params.require(:booking_tour).permit(:full_name, :address, :phone, :email, :passport, :tour_schedule_id, :adult, :child, :child_2, :child_3, :message, :tour_id, :tour_name, :price, :from_date, :to_date)
    end
end
