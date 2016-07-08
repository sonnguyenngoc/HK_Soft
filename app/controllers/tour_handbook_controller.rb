class TourHandbookController < ApplicationController
  def index
    @page_name = Category.where(description: "tour_handbook").first
    @blogs = ArticleCategory.get_tour_handbook_blogs.paginate(page: params[:page], per_page: 3)
  end

  def tour_handbook_sub_1
    @page_name = Category.where(description: "tour_handbook").first
    @article_category = ArticleCategory.find(params[:tour_handbook_sub_1])
    @blogs = @article_category.get_blogs_for_categories(params).paginate(page: params[:page], per_page: 3)
  end

  def tour_handbook_sub_2
    @page_name = Category.where(description: "tour_handbook").first
    @article_category = ArticleCategory.find(params[:tour_handbook_sub_2])
    @blogs = @article_category.get_blogs_for_categories(params).paginate(page: params[:page], per_page: 3)
  end

  def tour_handbook_detail
    @page_name = Category.where(description: "tour_handbook").first
    @style_body = "single single-pos"
    @blog_detail = Article.find(params[:tour_handbook_detail_id])
  end
end
