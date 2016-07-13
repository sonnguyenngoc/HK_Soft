class CreateBookingHotels < ActiveRecord::Migration
  def change
    create_table :booking_hotels do |t|
      t.string :full_name
      t.string :phone
      t.string :email
      t.datetime :date_from
      t.datetime :date_to
      t.integer :adult
      t.integer :child
      t.integer :room_number
      t.integer :hotel_room_id
      t.string :hotel_room_name
      t.decimal :price

      t.timestamps null: false
    end
  end
end
