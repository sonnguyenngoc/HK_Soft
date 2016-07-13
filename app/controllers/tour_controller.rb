class TourController < ApplicationController
  def index
    @page_name = Category.where(description: "tour").first
    @tours = Tour.get_tour_listing(params).paginate(page: params[:page], per_page: 12)
  end
  
  def tour_search
    @page_name = Category.where(description: "tour").first
    @tours = Tour.get_tour_listing(params).paginate(page: params[:page], per_page: 12)
  end

  def domestic_tour
    @page_name = Category.where(description: "tour").first
    @tours = Tour.get_domestic_tour(params).paginate(page: params[:page], per_page: 12)
  end

  def foreign_tour
    @page_name = Category.where(description: "tour").first
    @tours = Tour.get_foreign_tour(params).paginate(page: params[:page], per_page: 12)
  end

  def tour_packages
    @page_name = Category.where(description: "tour").first
    @article_category = ArticleCategory.find(params[:tour_packages_id])
    @tours = Tour.get_tour_packages(params).paginate(page: params[:page], per_page: 12)
  end

  def tour_detail
    @page_name = Category.where(description: "tour").first
    @tour = Tour.find(params[:tour_id])
  end

  def tour_booking
    @page_name = Category.where(description: "tour").first
    @tour = Tour.find(params[:tour_booking_id])
    @booking_tour = BookingTour.new
  end
  
  def tour_thankyou
    @page_name = Category.where(description: "tour").first
  end
  
  def tour_pricing
  end
end
