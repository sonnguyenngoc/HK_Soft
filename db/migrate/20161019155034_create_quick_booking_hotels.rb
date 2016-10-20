class CreateQuickBookingHotels < ActiveRecord::Migration
  def change
    create_table :quick_booking_hotels do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.string :passport
      t.string :hotel_name
      t.string :location
      t.datetime :date_from
      t.datetime :date_to
      t.integer :number, default: 1
      t.integer :adult, default: 1
      t.integer :child, default: 0
      t.text :message

      t.timestamps null: false
    end
  end
end
