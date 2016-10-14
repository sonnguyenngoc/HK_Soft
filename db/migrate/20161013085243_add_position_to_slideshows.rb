class AddPositionToSlideshows < ActiveRecord::Migration
  def change
    add_column :slideshows, :position, :integer
  end
end
