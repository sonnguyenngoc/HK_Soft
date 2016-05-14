class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController   
  def facebook     
    @user = User.find_for_facebook_oauth(request.env["omniauth.auth"], current_user)      
      if @user.persisted?       
        sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
        set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
      else
        session["devise.facebook_data"] = request.env["omniauth.auth"]
        redirect_to new_user_registration_url
      end
    end
  end
  
  def failure
    redirect_to root_path
  end
  
  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
end