class AddTitle3ToSlideshows < ActiveRecord::Migration
  def change
    add_column :slideshows, :title_3, :string
  end
end
