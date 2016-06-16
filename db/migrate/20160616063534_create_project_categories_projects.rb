class CreateProjectCategoriesProjects < ActiveRecord::Migration
  def change
    create_table :project_categories_projects do |t|
      t.integer :project_category_id
      t.integer :project_id

      t.timestamps null: false
    end
  end
end
