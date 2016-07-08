class AddChild2AndChild3ToBookingTours < ActiveRecord::Migration
  def change
    add_column :booking_tours, :child_2, :integer, default: 0
    add_column :booking_tours, :child_3, :integer, default: 0
  end
end
