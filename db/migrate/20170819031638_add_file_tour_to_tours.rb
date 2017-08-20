class AddFileTourToTours < ActiveRecord::Migration
  def change
    add_column :tours, :file_tour, :string
  end
end
