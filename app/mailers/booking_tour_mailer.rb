class BookingTourMailer < ApplicationMailer
    default from: 'sonnnn@hoangkhang.com.vn'
    
    def booking_tour_email(booking_tour)
        @booking_tour = booking_tour
        mail(to: "sonnnn@hoangkhang.com.vn", subject: "newdiscovery.vn - Đăng ký tour")
    end
end
