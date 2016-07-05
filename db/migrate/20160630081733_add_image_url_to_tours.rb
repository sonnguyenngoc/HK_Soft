class AddImageUrlToTours < ActiveRecord::Migration
  def change
    add_column :tours, :image_url, :string
  end
end
