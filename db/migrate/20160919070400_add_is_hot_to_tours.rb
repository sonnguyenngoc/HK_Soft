class AddIsHotToTours < ActiveRecord::Migration
  def change
    add_column :tours, :is_hot, :boolean, default: false
  end
end
