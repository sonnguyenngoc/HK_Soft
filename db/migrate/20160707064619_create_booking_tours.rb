class CreateBookingTours < ActiveRecord::Migration
  def change
    create_table :booking_tours do |t|
      t.string :full_name
      t.string :address
      t.string :phone
      t.string :email
      t.string :passport
      t.integer :tour_schedule_id
      t.integer :adult, default: 1
      t.integer :child, default: 0
      t.text :message
      t.integer :tour_id
      t.string :tour_name
      t.string :price

      t.timestamps null: false
    end
  end
end
