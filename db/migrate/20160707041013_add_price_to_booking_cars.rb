class AddPriceToBookingCars < ActiveRecord::Migration
  def change
    add_column :booking_cars, :price, :decimal
  end
end
