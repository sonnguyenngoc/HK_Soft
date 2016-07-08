class AddDescriptionToHotelRooms < ActiveRecord::Migration
  def change
    add_column :hotel_rooms, :description, :text
  end
end
