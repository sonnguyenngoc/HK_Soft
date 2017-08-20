class AddLabelToTours < ActiveRecord::Migration
  def change
    add_column :tours, :label, :string
  end
end
