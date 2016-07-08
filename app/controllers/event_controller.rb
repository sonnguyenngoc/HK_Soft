class EventController < ApplicationController
  def index
    @page_name = Category.where(description: "event").first
    @blogs = ArticleCategory.get_event_blogs.paginate(page: params[:page], per_page: 3)
  end

  def event_listing
    @page_name = Category.where(description: "event").first
    @article_category = ArticleCategory.find(params[:event_id])
    @blogs = @article_category.get_blogs_for_categories(params).paginate(page: params[:page], per_page: 3)
  end

  def event_detail
    @style_body = "single single-pos"
    @article_category = ArticleCategory.find(params[:article_category_id])
    @blog_detail = Article.find(params[:event_detail_id])
  end
end
