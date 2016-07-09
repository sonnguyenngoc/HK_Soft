class ChangeBookingHotelsAdultChildDefault < ActiveRecord::Migration
  def change
    change_column :booking_hotels, :adult, :integer, default: 1
    change_column :booking_hotels, :child, :integer, default: 0
  end
end
