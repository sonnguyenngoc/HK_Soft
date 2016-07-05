class CreateHotelImages < ActiveRecord::Migration
  def change
    create_table :hotel_images do |t|
      t.string :image_url
      t.integer :hotel_id

      t.timestamps null: false
    end
  end
end
