class BookingHotelMailer < ApplicationMailer
    default from: 'soft.support@hoangkhang.com.vn'
    
    def booking_hotel_email(booking_hotel)
        @booking_hotel = booking_hotel
        mail(to: "sonnn0811@gmail.com", subject: "newdiscovery.vn - Đặt Khách Sạn")
    end
end
