class AddApprovedToTours < ActiveRecord::Migration
  def change
    add_column :tours, :approved, :boolean, default: false
  end
end
