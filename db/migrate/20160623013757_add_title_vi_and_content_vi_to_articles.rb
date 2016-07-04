class AddTitleViAndContentViToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :title_vi, :string
    add_column :articles, :content_vi, :string
  end
end
