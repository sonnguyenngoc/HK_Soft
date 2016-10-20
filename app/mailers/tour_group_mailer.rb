class TourGroupMailer < ApplicationMailer
	default from: 'soft.support@hoangkhang.com.vn'
	
	def tour_group_email(tour_group)
        @tour_group = tour_group
        mail(to: "sonnnn@hoangkhang.com.vn", subject: "newdiscovery.vn - Đặt tour đoàn")
    end
end
