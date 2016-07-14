class AddNameViAndDescriptionViToArticleCategories < ActiveRecord::Migration
  def change
    add_column :article_categories, :name_vi, :string
    add_column :article_categories, :description_vi, :string
  end
end
