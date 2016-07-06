class ContactsController < ApplicationController
  # POST /contacts
  # POST /contacts.json
  def create
    @contact = Contact.new(contact_params)
  
    respond_to do |format|
      if @contact.save
        format.html { redirect_to contact_thankyou_path }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
      params.require(:contact).permit(:name, :phone, :email, :message)
    end
end