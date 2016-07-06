class ContactController < ApplicationController
  def index
    @contact = Contact.new
  end
  
  def contact_thankyou
  end
end
