class BookHotelController < ApplicationController
  protect_from_forgery :except =>[:slideshow_popup]
  
  def index
    @page_name = Category.where(description: "services").first
    @hotels = Hotel.get_all_hotels
  end

  def book_hotel_detail
    @page_name = Category.where(description: "services").first
    @hotel = Hotel.find(params[:hotel_id])
  end

  def hotel_booking
    @page_name = Category.where(description: "services").first
    @hotel_booking = Hotel.find(params[:hotel_booking_id])
    @hotel_checkout = BookingHotel.new
  end

  def slideshow_popup
  end
  
  def hotel_thankyou
    if !params[:booking_hotel_id].present?
      redirect_to root_path
    end
    @page_name = Category.where(description: "services").first
    @booking_hotel = BookingHotel.find(params[:booking_hotel_id])
  end
end
