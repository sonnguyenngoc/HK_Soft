class AddTimeLineToTours < ActiveRecord::Migration
  def change
    add_column :tours, :time_line, :string
  end
end
