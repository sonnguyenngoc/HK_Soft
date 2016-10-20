class AboutUsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:image_popup]
  
  def index
    @about_us = Article.get_about_us_blog
  end
  
  def info_system_1
    @style_body = "single single-pos"
  end
  
  def info_system_2
    @style_body = "single single-pos"
  end
  
  def info_system_3
    @style_body = "single single-pos"
  end
  
  def info_system_4
    @style_body = "single single-pos"
  end
  
  def info_system_5
    @style_body = "single single-pos"
  end
  
  def activities_photo
  end
  
  def image_popup
    @activities_photo = Gallery.find(params[:activities_photo_id])
    render :layout => false
  end
end
