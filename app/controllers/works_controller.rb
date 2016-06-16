class WorksController < ApplicationController
    def index
        @project_categories = ProjectCategory.get_all_categories
    end
    
    def detail
    end
end
