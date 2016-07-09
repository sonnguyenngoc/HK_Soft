class TourSchedule < ActiveRecord::Base
    has_many :booking_tours
    
    def remain_seats
        (booking_tours.sum("adult") + booking_tours.sum("child") + booking_tours.sum("child_2") + booking_tours.sum("child_3"))
    end
    
    def self.get_tour_schedules
        self.where("from_date > ?", Time.now)
    end
end
