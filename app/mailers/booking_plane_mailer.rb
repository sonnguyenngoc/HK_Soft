class BookingPlaneMailer < ApplicationMailer
    def booking_plane_email(booking_plane)
        @booking_plane = booking_plane
        mail(to: "info@newdiscovery.vn", subject: "newdiscovery.vn - Đăng ký vé máy bay")
    end
end
