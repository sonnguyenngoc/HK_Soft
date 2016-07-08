class BookingTour < ActiveRecord::Base
    belongs_to :tour
    belongs_to :tour_schedule
    before_validation :update_tour_info
    
    def update_tour_info
        self.tour_name = tour.name
        self.price = tour.new_price
    end
end
