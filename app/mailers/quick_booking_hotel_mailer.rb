class QuickBookingHotelMailer < ApplicationMailer
	def quick_booking_hotel_email(quick_booking_hotel)
			@quick_booking_hotel = quick_booking_hotel
			mail(to: "sonnn0811@gmail.com", subject: "Newdiscovery.vn - Đặt Phòng Khách Sạn Nhanh")
	end
end