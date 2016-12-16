class HomeController < ApplicationController
    def index
        @domestic_tour = Tour.get_lastest_domestic_tour
        @foreign_tour = Tour.get_lastest_foreign_tour
        @new_year_tours = Tour.get_lastest_new_year_tours_listing
        @discount_tours = Tour.get_discount_tours
        @cars = Car.get_lastest_cars
        @booking_tour = BookingTour.new
        @booking_car = BookingCar.new
        @booking_hotel = BookingHotel.new
        @slides = Slideshow.get_all_slides
    end
    
    def google_search_console
        render :layout => false
    end
    
    def sitemap
    end
end
