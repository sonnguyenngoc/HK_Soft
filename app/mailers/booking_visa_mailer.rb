class BookingVisaMailer < ApplicationMailer
    def booking_visa_email(booking_visa)
        @booking_visa = booking_visa
        mail(to: "sonnnn@hoangkhang.com.vn", subject: "Newdiscovery.vn - Đăng Ký Làm Thẻ Visa")
    end
end
