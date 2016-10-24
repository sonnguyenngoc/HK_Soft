class BookingHotelMailer < ApplicationMailer
    def booking_hotel_email(booking_hotel)
        @booking_hotel = booking_hotel
        mail(to: "sonnn0811@gmail.com", subject: "Newdiscovery.vn - Đặt Khách Sạn")
    end
end
