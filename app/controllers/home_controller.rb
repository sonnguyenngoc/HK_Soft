class HomeController < ApplicationController
    def index
        @lastest_blogs = Article.get_lastest_blog_posts
    end
end
