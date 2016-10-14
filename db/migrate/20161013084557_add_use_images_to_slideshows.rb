class AddUseImagesToSlideshows < ActiveRecord::Migration
  def change
    add_column :slideshows, :use_images, :boolean, default: true
  end
end
