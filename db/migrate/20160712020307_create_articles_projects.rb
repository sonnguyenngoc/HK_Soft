class CreateArticlesProjects < ActiveRecord::Migration
  def change
    create_table :articles_projects do |t|
      t.integer :article_id
      t.integer :project_id

      t.timestamps null: false
    end
  end
end
