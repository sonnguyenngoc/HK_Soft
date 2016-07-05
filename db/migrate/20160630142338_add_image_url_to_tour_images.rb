class AddImageUrlToTourImages < ActiveRecord::Migration
  def change
    add_column :tour_images, :image_url, :string
  end
end
