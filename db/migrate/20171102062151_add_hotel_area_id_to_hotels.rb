class AddHotelAreaIdToHotels < ActiveRecord::Migration
  def change
    add_column :hotels, :hotel_area_id, :integer
  end
end
