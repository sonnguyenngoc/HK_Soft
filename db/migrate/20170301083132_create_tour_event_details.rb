class CreateTourEventDetails < ActiveRecord::Migration
  def change
    create_table :tour_event_details do |t|
      t.integer :tour_event_id
      t.integer :tour_id

      t.timestamps null: false
    end
  end
end
