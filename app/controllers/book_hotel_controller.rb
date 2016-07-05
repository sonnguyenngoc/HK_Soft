class BookHotelController < ApplicationController
  protect_from_forgery :except =>[:slideshow_popup]
  
  def index
    @page_name = Category.where(description: "book_hotel").first
    @hotels = Hotel.get_all_hotels
  end

  def book_hotel_detail
    @page_name = Category.where(description: "book_hotel").first
    @hotel = Hotel.find(params[:hotel_id])
  end

  def hotel_booking
    @page_name = Category.where(description: "book_hotel").first
    @hotel_booking = Hotel.find(params[:hotel_booking_id])
  end

  def slideshow_popup
  end
  
  def hotel_thankyou
    @page_name = Category.where(description: "book_hotel").first
  end
end
