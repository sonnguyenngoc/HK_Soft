class ChangeBookingHotelsRoomNumberDefault < ActiveRecord::Migration
  def change
    change_column :booking_hotels, :room_number, :integer, default: 1
  end
end
