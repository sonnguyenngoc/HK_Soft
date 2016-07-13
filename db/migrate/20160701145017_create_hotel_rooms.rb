class CreateHotelRooms < ActiveRecord::Migration
  def change
    create_table :hotel_rooms do |t|
      t.string :image_url
      t.string :room_type
      t.string :price
      t.decimal :people_number
      t.decimal :bed_number
      t.integer :hotel_id

      t.timestamps null: false
    end
  end
end
