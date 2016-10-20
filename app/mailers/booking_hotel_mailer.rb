class BookingHotelMailer < ApplicationMailer
    default from: 'sonnnn@hoangkhang.com.vn'
    
    def booking_hotel_email(booking_hotel)
        @booking_hotel = booking_hotel
        mail(to: "sonnnn@hoangkhang.com.vn", subject: "newdiscovery.vn - Đăng ký phòng khách sạn")
    end
end
