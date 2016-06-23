class AddAuthorViAndNameViAndDescriptionViToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :author_vi, :string
    add_column :projects, :name_vi, :string
    add_column :projects, :description_vi, :string
  end
end
