class WorksController < ApplicationController
    def index
        @project_categories = ProjectCategory.get_all_categories
        @projects = Project.all
    end
    
    def detail
    end
end
