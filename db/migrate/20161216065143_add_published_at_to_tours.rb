class AddPublishedAtToTours < ActiveRecord::Migration
  def change
    add_column :tours, :published_at, :datetime
  end
end
