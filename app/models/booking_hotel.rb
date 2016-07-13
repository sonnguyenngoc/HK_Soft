class BookingHotel < ActiveRecord::Base
    belongs_to :hotel_room
    belongs_to :hotel
    before_validation :update_room_info
    
    def update_room_info
        self.hotel_room_name = hotel_room.room_type
        self.price = hotel_room.price
    end
end
