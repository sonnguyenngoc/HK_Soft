class AddCarIdToBookingCars < ActiveRecord::Migration
  def change
    add_column :booking_cars, :car_id, :integer
  end
end
