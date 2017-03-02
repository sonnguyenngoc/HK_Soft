class CreateTourEvents < ActiveRecord::Migration
  def change
    create_table :tour_events do |t|
      t.string :title
      t.boolean :active, default: false
      t.text :description

      t.timestamps null: false
    end
  end
end
