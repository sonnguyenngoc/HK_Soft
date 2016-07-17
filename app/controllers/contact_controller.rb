class ContactController < ApplicationController
    def index
        @info_contact = Company.all
        
        #contact form send message
        if params[:contact].present?
            @contact = Contact.new(contact_params)
            respond_to do |format|
                @contact.save
                format.html { redirect_to controller: "contact", action: "send_success" }
            end
        end
    end
    
    def send_success
        @info_contact = Company.all
    end
    
    private
    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
        params.require(:contact).permit(:name, :email, :message, :phone)
    end
end
