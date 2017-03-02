class TourController < ApplicationController
  def index
    @page_name = Category.where(description: "tour").first
    @tours = Tour.get_tour_listing(params).paginate(page: params[:page], per_page: 12)
  end
  
  def deal_tours
    @page_name = "Tour Khuyến Mãi"
    @tours = Tour.get_deal_tours_listing.paginate(page: params[:page], per_page: 12)
  end
  
  def new_year_tours
    @page_name = "Tour Tết 2017"
    @tours = Tour.get_new_year_tours_listing.paginate(page: params[:page], per_page: 12)
  end
  
  def event_tours
    @page_name = ArticleCategory.find(params[:id])
    @tours = Tour.get_new_year_tours_listing.paginate(page: params[:page], per_page: 12)
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
    @meta_keywords = @tour.meta_keywords
    @meta_description = @tour.meta_description
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
