class InformationController < ApplicationController
  def about_us
    @title_head = "Về chúng tôi"
    @about_us =  Article.get_blog_about_us
  end
  
  def contact_us
    @title_head = "Liên hệ"
    @contact = Contact.new
    @company = Company.all
  end
  
  def finish_contact_us
    @title_head = "Cảm ơn"
  end
  
  def finish_newsletter
    @title_head = "Cảm ơn"
  end
  
  def sitemap
    @title_head = "Sitemap"
  end
  
  def faq
    @title_head = "Câu hỏi thường gặp"
    @faq = Article.get_faq
  end
  
  def delivery
    @delivery_information = Article.get_delivery_information
    @title_head = "Thông tin giao hàng"
  end
  
  def privacy_policy
    @privacy_policy = Article.get_privacy_policy
    @title_head = "Chính sách bảo mật"
  end
  
  def customer_support_center
    @customer_support_center = Article.get_customer_support_center
    @title_head = "Trung tâm hổ trợ khách hàng"
  end
  
  def delivery_policy
    @delivery_policy = Article.get_delivery_policy
    @title_head = "Chính sách giao hàng"
  end
  
  def payment_policy
    @payment_policy = Article.get_payment_policy
    @title_head = "Chính sách thanh toán"
  end
  
  def warranty_policy
    @warranty_policy = Article.get_warranty_policy
    @title_head = "Chính sách bảo hành"
  end
  
  def terms_conditions
    @terms_information = Article.get_terms_conditions
    @title_head = "Chính sách và quy định trang"
  end

end
