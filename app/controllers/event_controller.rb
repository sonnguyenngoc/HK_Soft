class EventController < ApplicationController
  def index
    @page_name = Category.where(description: "event").first
    @blogs = ArticleCategory.get_event_blogs
  end

  def event_listing
    @page_name = Category.where(description: "event").first
    @article_category = ArticleCategory.find(params[:event_id])
    @blogs = @article_category.get_blogs_for_categories(params)
  end

  def event_detail
    @style_body = "single single-pos"
  end
end
