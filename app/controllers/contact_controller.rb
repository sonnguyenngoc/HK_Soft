class ContactController < ApplicationController
    def index
        @contact = Contact.new
    end
    def message_sent_success
    end
end
