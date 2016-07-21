class HomeController < ApplicationController
    def index
        @project_categories = ProjectCategory.get_all_categories
        @projects = Project.order("created_at DESC")
    end
end
