class BookingHotel < ActiveRecord::Base
    belongs_to :hotel_room
    belongs_to :hotel
end
