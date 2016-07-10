class BookHotelController < ApplicationController
  protect_from_forgery :except =>[:slideshow_popup]
  
  def index
    @page_name = Category.where(description: "services").first
    @hotels = Hotel.get_all_hotels(params).paginate(page: params[:page], per_page: 9)
  end
  
  def hotel_search
    @page_name = Category.where(description: "services").first
    @hotels = Hotel.get_all_hotels(params).paginate(page: params[:page], per_page: 9)
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
    @hotel_image = Hotel.find(params[:hotel_id])
  end
  
  def hotel_thankyou
    @page_name = Category.where(description: "services").first
    
  end
end
