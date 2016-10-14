class CreateTourHighlights < ActiveRecord::Migration
  def change
    create_table :tour_highlights do |t|
      t.string :title
      t.integer :tour_id

      t.timestamps null: false
    end
  end
end
