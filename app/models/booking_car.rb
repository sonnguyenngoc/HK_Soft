class BookingCar < ActiveRecord::Base
    belongs_to :car
    before_validation :update_car_info
    
    def update_car_info
        self.price = car.price
    end
end
