class ApplicationController < ActionController::Base
  before_action :set_locale
  
  protect_from_forgery
  
  layout :layout_by_resource
  protect_from_forgery with: :exception
  
  protected
    def layout_by_resource
      if controller_name == "home" || controller_name == "about_us" || controller_name == "tour" || controller_name == "event" || controller_name == "car_hire" || controller_name == "book_hotel" || controller_name == "tour_handbook" || controller_name == "travel_news" || controller_name == "service" || controller_name == "contact" || controller_name == "hot_tours" || controller_name == "tour_group"
        "frontend"
      elsif (devise_controller? && resource_name == :user && action_name != 'edit') || controller_name == 'passwords'
        "login"
      elsif controller_name == "main" || controller_name == "products"|| controller_name == "hotel_areas" || controller_name == "categories" || controller_name == "manufacturers" ||
            controller_name == "articles" || controller_name == "article_categories" || controller_name == "areas" || controller_name == "orders" || controller_name == "slideshows" ||
            controller_name == "delivery_methods" || controller_name == "payment_methods" || controller_name == "comments" || controller_name == "questions" || controller_name == "customers" ||
            controller_name == "coupons" || controller_name == "vouchers" || controller_name == "comment_articles" || controller_name == "companies" || controller_name == "code_statuses" || controller_name == "testimonials" ||
            controller_name == "options" || controller_name == "users" || controller_name == "user_groups" || controller_name == "contacts" || controller_name == "newsletters" || controller_name == "tours" || controller_name == "hotels" || controller_name == "cars" ||
            controller_name == "booking_cars" || controller_name == "tour_events" || controller_name == "booking_hotels" || controller_name == "booking_planes" || controller_name == "booking_tours" || controller_name == "booking_visas" || controller_name == "galleries" || controller_name == "tour_groups" || controller_name == "quick_booking_hotels" || controller_name == "countries" || controller_name == "visas"
          authenticate_user!
          redirect_to root_path if current_user.is_admin != true
          "backend"
      end
    end
    
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
  
  def extract_locale_from_tld
    parsed_locale = request.host.split('.').last
    I18n.available_locales.map(&:to_s).include?(parsed_locale) ? parsed_locale : nil
  end
  
  def default_url_options(options = {})
    { locale: I18n.locale }.merge options
  end
end
