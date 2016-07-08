class AddPassportToBookingPlanes < ActiveRecord::Migration
  def change
    add_column :booking_planes, :passport, :string
  end
end
