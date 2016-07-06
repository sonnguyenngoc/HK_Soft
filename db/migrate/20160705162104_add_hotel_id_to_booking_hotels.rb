class AddHotelIdToBookingHotels < ActiveRecord::Migration
  def change
    add_column :booking_hotels, :hotel_id, :integer
  end
end
