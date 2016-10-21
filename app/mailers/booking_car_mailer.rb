class BookingCarMailer < ApplicationMailer
    default from: 'soft.support@hoangkhang.com.vn'
    
    def booking_car_email(booking_car)
        @booking_car = booking_car
        mail(to: "sonnn0811@gmail.com", subject: "Newdiscovery.vn - Thuê Xe Ô Tô")
    end
end
