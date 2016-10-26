class TourGroupMailer < ApplicationMailer
	def tour_group_email(tour_group)
        @tour_group = tour_group
        mail(to: "info@newdiscovery.vn", subject: "Newdiscovery.vn - Giá Hot Tour Đoàn")
    end
end
