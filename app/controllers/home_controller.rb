class HomeController < ApplicationController
    def index
        @new_products = Product.get_by_new
        @lastest_blogs = Article.get_lastest_blog_posts
        @info_contact = Company.all
    end
end
