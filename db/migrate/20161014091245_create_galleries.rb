class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.string :image_url
      t.string :title
      t.text :description

      t.timestamps null: false
    end
  end
end
