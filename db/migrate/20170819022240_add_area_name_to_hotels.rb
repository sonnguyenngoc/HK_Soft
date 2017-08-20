class AddAreaNameToHotels < ActiveRecord::Migration
  def change
    add_column :hotels, :area_name, :string
  end
end
