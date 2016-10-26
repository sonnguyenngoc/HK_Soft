class ContactMailer < ApplicationMailer
    def contact_email(contact)
        @contact = contact
        mail(to: "info@newdiscovery.vn", subject: "Newdiscovery.vn - Tin Nhắn Liên Hệ")
    end
end
