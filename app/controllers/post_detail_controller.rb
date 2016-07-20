class PostDetailController < ApplicationController
  def index
    @article_category= ArticleCategory.find(params[:category_id])
    @article = @article_category.get_articles_for_categories(params).last
  end
end
