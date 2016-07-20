class AddNameViAndDescriptionViToProjectCategories < ActiveRecord::Migration
  def change
    add_column :project_categories, :name_vi, :string
    add_column :project_categories, :description_vi, :text
  end
end
