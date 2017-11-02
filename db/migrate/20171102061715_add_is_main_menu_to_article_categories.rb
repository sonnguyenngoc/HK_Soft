class AddIsMainMenuToArticleCategories < ActiveRecord::Migration
  def change
    add_column :article_categories, :is_main_menu, :boolean, default: false
  end
end
