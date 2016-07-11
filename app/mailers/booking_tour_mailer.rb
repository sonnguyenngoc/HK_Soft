class BookingTourMailer < ApplicationMailer
    def booking_tour_email(booking_tour)
        @booking_tour = booking_tour
        mail(to: "info@newdiscovery.vn", subject: "newdiscovery.vn - Đăng ký tour")
    end
end
