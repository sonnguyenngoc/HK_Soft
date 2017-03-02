class AddResortNameToTours < ActiveRecord::Migration
  def change
    add_column :tours, :resort_name, :string
  end
end
