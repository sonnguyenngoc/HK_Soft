class AddHiddenToTours < ActiveRecord::Migration
  def change
    add_column :tours, :hidden, :boolean, default: false
  end
end
