class Blog3Controller < ApplicationController
    def index
        @articles = Article.get_all_blogs.order("created_at DESC").paginate(:page => params[:page], :per_page => 6)
    end
    def blog_post
        @news = Article.find(params[:news_id])
        @lastest_news = Article.get_all_blogs
        @categories = ArticleCategory.order("name ASC")
        @program_languages = ProgramLanguage.all
    end
end
