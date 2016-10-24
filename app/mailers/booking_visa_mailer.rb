class BookingVisaMailer < ApplicationMailer
    def booking_visa_email(booking_visa)
        @booking_visa = booking_visa
        mail(to: "sonnn0811@gmail.com", subject: "Newdiscovery.vn - Đăng Ký Làm Thẻ Visa")
    end
end
