class HomeController < ApplicationController
  def index
    @lastest_blog_posts = Article.get_lastest_blog_posts
    @option = Option.get("common.page_title")
    @title_head = @option.title
    @META_KEYWORDS = @option.value
    @META_DESCRIPTION = @option.note
    @blog_deal = Article.get_banner_event_top
    @areas = Area.get_all_areas
    @blog_advertise = Article.get_banner_by_area(@current_area)
  end
  
  def countdown
    
    
    render layout: nil
  end
  
  def change_current_area
    area = Area.where(id: params[:area_id]).first
    session[:current_area_id] = area.nil? ? nil : area.id
    
    redirect_to :back
  end
  
  def go_home
    session[:current_area_id] = nil
    
    redirect_to controller: "home", action: "index"
  end
  
  def home_tab
    render layout: nil
  end
end
