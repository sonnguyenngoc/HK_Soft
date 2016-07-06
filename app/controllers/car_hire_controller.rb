class CarHireController < ApplicationController
  def index
    @page_name = Category.where(description: "services").first
    @cars = Car.get_all_cars
  end

  def car_list_view
  end

  def car_grid_view
    @page_name = Category.where(description: "services").first
    @car_category = ArticleCategory.find(params[:car_category_id])
    @cars = Car.get_car_categories(params)
  end

  def car_detail
    @page_name = Category.where(description: "services").first
    @car_detail = Car.find(params[:car_id])
  end
  
  def car_booking
    @page_name = Category.where(description: "services").first
    @car_booking = Car.find(params[:car_book_id])
    @car_checkout = BookingCar.new
  end
  
  def car_thankyou
    if !params[:booking_car_id].present?
      redirect_to root_path
    end
    @page_name = Category.where(description: "car_hire").first
    @booking_car = BookingCar.find(params[:booking_car_id])
  end
end
