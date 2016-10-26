class BookingTourMailer < ApplicationMailer
    def booking_tour_email(booking_tour)
        @booking_tour = booking_tour
        mail(to: "info@newdiscovery.vn", subject: "Newdiscovery.vn - Đăng Ký Tour")
    end
end
