class CreateBookingPlanes < ActiveRecord::Migration
  def change
    create_table :booking_planes do |t|
      t.string :full_name
      t.string :email
      t.string :phone
      t.string :address
      t.integer :adult, default: 1
      t.integer :child, default: 0
      t.integer :seat_number
      t.datetime :date_from
      t.datetime :date_to
      t.string :ticket_type
      t.string :address_from
      t.string :address_to
      t.text :message

      t.timestamps null: false
    end
  end
end
