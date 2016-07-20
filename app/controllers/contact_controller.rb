class ContactController < ApplicationController
    def index
        @contact = Contact.new
        @company = Company.get_company
    end
    def message_sent_success
    end
end
