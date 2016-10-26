class HomeController < ApplicationController
    layout false, only: [:google_search_console]
    def index
        @domestic_tour = Tour.get_lastest_domestic_tour
        @foreign_tour = Tour.get_lastest_foreign_tour
        @discount_tours = Tour.get_discount_tours
        @cars = Car.get_lastest_cars
        @booking_tour = BookingTour.new
        @booking_car = BookingCar.new
        @booking_hotel = BookingHotel.new
        @slides = Slideshow.get_all_slides
    end
    def google_search_console
    end
end
