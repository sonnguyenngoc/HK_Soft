class BookingHotelMailer < ApplicationMailer
    def booking_hotel_email(booking_hotel)
        @booking_hotel = booking_hotel
        mail(to: "info@newdiscovery.vn", subject: "newdiscovery.vn - Đăng ký phòng khách sạn")
    end
end
