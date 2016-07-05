class AddArticleCategoryIdToTours < ActiveRecord::Migration
  def change
    add_column :tours, :article_category_id, :integer
  end
end
