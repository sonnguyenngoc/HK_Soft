class BookingPlaneMailer < ApplicationMailer
    default from: 'sonnnn@hoangkhang.com.vn'
    
    def booking_plane_email(booking_plane)
        @booking_plane = booking_plane
        mail(to: "sonnnn@hoangkhang.com.vn", subject: "newdiscovery.vn - Đăng ký vé máy bay")
    end
end
