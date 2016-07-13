class AddTourIdToTourImages < ActiveRecord::Migration
  def change
    add_column :tour_images, :tour_id, :integer
  end
end
