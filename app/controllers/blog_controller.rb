class BlogController < ApplicationController
  def index
    @title_head = "Danh sách bài viết"
    @blogs = Article.get_all_blogs.paginate(:page => params[:page], :per_page => 3)
    @lastest_blogs = Article.get_lastest_blog_posts
  end

  def detail
    @blog = Article.find(params[:blog_id])
    @lastest_blogs = Article.get_lastest_blog_posts
  end
end
