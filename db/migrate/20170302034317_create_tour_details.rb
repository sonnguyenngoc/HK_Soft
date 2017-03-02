class CreateTourDetails < ActiveRecord::Migration
  def change
    create_table :tour_details do |t|
      t.integer :tour_id
      t.string :title
      t.text :content

      t.timestamps null: false
    end
  end
end
