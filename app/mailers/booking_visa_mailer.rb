class BookingVisaMailer < ApplicationMailer
    def booking_visa_email(booking_visa)
        @booking_visa = booking_visa
        mail(to: "info@newdiscovery.vn", subject: "newdiscovery.vn - Đăng ký làm thè visa")
    end
end
