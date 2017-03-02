class HomeController < ApplicationController
    def index
        @tour_events = TourEvent.get_active_tour_events
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
