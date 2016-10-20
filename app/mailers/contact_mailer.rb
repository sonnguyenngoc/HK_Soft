class ContactMailer < ApplicationMailer
    default from: 'sonnnn@hoangkhang.com.vn'
    
    def contact_email(contact)
        @contact = contact
        mail(to: "sonnnn@hoangkhang.com.vn", subject: "newdiscovery.vn - Tin nhắn liên hệ")
    end
end
