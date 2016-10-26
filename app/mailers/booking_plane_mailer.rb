class BookingPlaneMailer < ApplicationMailer
    def booking_plane_email(booking_plane)
        @booking_plane = booking_plane
        mail(to: "info@newdiscovery.vn", subject: "Newdiscovery.vn - Đặt Vé Máy Bay")
    end
end
