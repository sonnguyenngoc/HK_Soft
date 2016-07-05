class CreateHotels < ActiveRecord::Migration
  def change
    create_table :hotels do |t|
      t.string :image_url
      t.string :name
      t.string :hotel_type
      t.string :address
      t.string :position
      t.integer :area_id
      t.decimal :avg_price
      t.string :services
      t.text :content

      t.timestamps null: false
    end
  end
end
