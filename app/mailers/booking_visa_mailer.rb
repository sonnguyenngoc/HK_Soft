class BookingVisaMailer < ApplicationMailer
    default from: 'sonnnn@hoangkhang.com.vn'
    
    def booking_visa_email(booking_visa)
        @booking_visa = booking_visa
        mail(to: "sonnnn@hoangkhang.com.vn", subject: "newdiscovery.vn - Đăng ký làm thè visa")
    end
end
