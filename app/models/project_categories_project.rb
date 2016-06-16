class ProjectCategoriesProject < ActiveRecord::Base
    belongs_to :project
    belongs_to :project_category
end
