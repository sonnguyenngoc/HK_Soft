class ContactMailer < ApplicationMailer
    def contact_email(contact)
        @contact = contact
        mail(to: "info@newdiscovery.vn", subject: "newdiscovery.vn - Tin nhắn liên hệ")
    end
end
