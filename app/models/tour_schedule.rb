class TourSchedule < ActiveRecord::Base
    has_many :booking_tours
    
    def remain_seats
        seat - (booking_tours.sum("adult") + booking_tours.sum("child") + booking_tours.sum("child_2") + booking_tours.sum("child_3"))
    end
end
