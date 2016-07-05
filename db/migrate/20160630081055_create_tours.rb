class CreateTours < ActiveRecord::Migration
  def change
    create_table :tours do |t|
      t.string :type
      t.string :name
      t.boolean :is_sale
      t.decimal :discount_percent
      t.decimal :new_price
      t.decimal :old_price
      t.string :services
      t.string :duration
      t.string :position
      t.string :hotel
      t.string :transportation

      t.timestamps null: false
    end
  end
end
