class CreateBookingCars < ActiveRecord::Migration
  def change
    create_table :booking_cars do |t|
      t.string :full_name
      t.string :address
      t.string :phone
      t.string :email
      t.datetime :date_from
      t.datetime :date_to
      t.string :address_from
      t.string :address_to

      t.timestamps null: false
    end
  end
end
