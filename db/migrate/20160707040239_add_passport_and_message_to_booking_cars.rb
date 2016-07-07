class AddPassportAndMessageToBookingCars < ActiveRecord::Migration
  def change
    add_column :booking_cars, :passport, :string
    add_column :booking_cars, :message, :text
  end
end
