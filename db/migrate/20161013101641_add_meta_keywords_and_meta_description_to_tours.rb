class AddMetaKeywordsAndMetaDescriptionToTours < ActiveRecord::Migration
  def change
    add_column :tours, :meta_keywords, :string
    add_column :tours, :meta_description, :text
  end
end