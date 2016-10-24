class BookingTourMailer < ApplicationMailer
    def booking_tour_email(booking_tour)
        @booking_tour = booking_tour
        mail(to: "sonnn0811@gmail.com", subject: "Newdiscovery.vn - Đăng Ký Tour")
    end
end
