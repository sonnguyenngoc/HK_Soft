class ServiceController < ApplicationController
  def index
  end
  
  def plane_ticket
    @blogs = Article.get_plane_ticket_blogs.paginate(page: params[:page], per_page: 3)
  end
  
  def visa_card
    @blogs = Article.get_visa_card_blogs.paginate(page: params[:page], per_page: 3)
  end
  
  def plane_ticket_detail
    @blog_detail = Article.find(params[:plane_ticket_id])
    @style_body = "single single-pos"
  end
  
  def visa_card_detail
    @blog_detail = Article.find(params[:visa_card_id])
    @style_body = "single single-pos"
  end
  
  def plane_ticket_booking
    @booking_plane = BookingPlane.new
  end
  
  def visa_card_booking
    @booking_visa = BookingVisa.new
  end
  
  def plane_ticket_thankyou
  end
  
  def visa_card_thankyou
  end
    
end
