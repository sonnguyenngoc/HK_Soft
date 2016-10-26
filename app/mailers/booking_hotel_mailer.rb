class BookingHotelMailer < ApplicationMailer
    def booking_hotel_email(booking_hotel)
        @booking_hotel = booking_hotel
        mail(to: "info@newdiscovery.vn", subject: "Newdiscovery.vn - Đặt Khách Sạn")
    end
end
