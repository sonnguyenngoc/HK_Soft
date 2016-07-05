class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :image_url
      t.string :name
      t.decimal :price
      t.text :description
      t.text :content
      t.integer :manufacturer_id
      t.integer :article_category_id

      t.timestamps null: false
    end
  end
end
