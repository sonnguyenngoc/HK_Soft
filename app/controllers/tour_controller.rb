class TourController < ApplicationController
  def index
    @page_name = Category.where(description: "tour").first
    @tours = Tour.get_tour_listing
  end

  def domestic_tour
    @page_name = Category.where(description: "tour").first
    @tours = Tour.get_domestic_tour
  end

  def foreign_tour
    @page_name = Category.where(description: "tour").first
    @tours = Tour.get_foreign_tour
  end

  def tour_packages
    @page_name = Category.where(description: "tour").first
    @article_category = ArticleCategory.find(params[:tour_packages_id])
    @tours = Tour.get_tour_packages(params)
  end

  def tour_detail
    @page_name = Category.where(description: "tour").first
    @tour = Tour.find(params[:tour_id])
  end

  def tour_booking
    @page_name = Category.where(description: "tour").first
    @tour = Tour.find(params[:tour_booking_id])
  end
  
  def tour_thankyou
    @page_name = Category.where(description: "tour").first
  end
end
