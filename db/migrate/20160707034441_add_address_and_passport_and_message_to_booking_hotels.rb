class AddAddressAndPassportAndMessageToBookingHotels < ActiveRecord::Migration
  def change
    add_column :booking_hotels, :address, :string
    add_column :booking_hotels, :passport, :string
    add_column :booking_hotels, :message, :text
  end
end
