class AddIsNewYearToTours < ActiveRecord::Migration
  def change
    add_column :tours, :is_new_year, :boolean, default: false
  end
end
