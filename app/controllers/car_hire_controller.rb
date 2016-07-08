class CarHireController < ApplicationController
  def index
    @page_name = Category.where(description: "services").first
    @cars = Car.get_all_cars.paginate(page: params[:page], per_page: 15)
  end

  def car_list_view
  end

  def car_grid_view
    @page_name = Category.where(description: "services").first
    @car_category = ArticleCategory.find(params[:car_category_id])
    @cars = Car.get_car_categories(params).paginate(page: params[:page], per_page: 15)
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
    @page_name = Category.where(description: "services").first
  end
end
