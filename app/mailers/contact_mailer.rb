class ContactMailer < ApplicationMailer
    def contact_email(contact)
        @contact = contact
        mail(to: "sonnn0811@gmail.com", subject: "Newdiscovery.vn - Tin Nhắn Liên Hệ")
    end
end
