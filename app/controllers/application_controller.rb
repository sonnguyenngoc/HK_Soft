class ApplicationController < ActionController::Base
  layout :layout_by_resource
  protect_from_forgery with: :exception
  
  protected
    def layout_by_resource
      if controller_name == "home"
        "frontend"
      elsif controller_name == "main"
        "backend"
      end
    end
end
