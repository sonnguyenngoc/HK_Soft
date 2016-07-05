class AddContentToTours < ActiveRecord::Migration
  def change
    add_column :tours, :content, :text
  end
end
