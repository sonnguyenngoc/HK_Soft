class TravelNewsController < ApplicationController
  def index
    @page_name = Category.where(description: "travel_news").first
    @blogs = ArticleCategory.get_travel_news
  end

  def travel_news_detail
    @page_name = Category.where(description: "travel_news").first
    @style_body = "single single-pos"
    @blog_detail = Article.find(params[:travel_news_id])
  end
end
