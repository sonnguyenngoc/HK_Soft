class CreateVisas < ActiveRecord::Migration
  def change
    create_table :visas do |t|
      t.string :title_1
      t.text :content_1
      t.string :title_2
      t.text :content_2
      t.string :title_3
      t.text :content_3
      t.string :title_4
      t.text :content_4
      t.string :title_5
      t.text :content_5
      t.string :title_6
      t.text :content_6
      t.integer :country_id

      t.timestamps null: false
    end
  end
end
