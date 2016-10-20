class BookingCarMailer < ApplicationMailer
    default from: 'sonnnn@hoangkhang.com.vn'
    
    def booking_car_email(booking_car)
        @booking_car = booking_car
        mail(to: "sonnnn@hoangkhang.com.vn", subject: "newdiscovery.vn - Đăng ký đặt xe")
    end
end
