class BookingCarMailer < ApplicationMailer
    def booking_car_email(booking_car)
        @booking_car = booking_car
        mail(to: "info@newdiscovery.vn", subject: "Newdiscovery.vn - Thuê Xe Ô Tô")
    end
end
