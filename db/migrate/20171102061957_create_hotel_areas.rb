class CreateHotelAreas < ActiveRecord::Migration
  def change
    create_table :hotel_areas do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
