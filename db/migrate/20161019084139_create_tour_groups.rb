class CreateTourGroups < ActiveRecord::Migration
  def change
    create_table :tour_groups do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.string :passport
      t.string :tour_name
      t.integer :number
      t.integer :standard_hotel
      t.datetime :date_from
      t.datetime :date_to
      t.decimal :price
      t.text :message
      t.string :address_from

      t.timestamps null: false
    end
  end
end
