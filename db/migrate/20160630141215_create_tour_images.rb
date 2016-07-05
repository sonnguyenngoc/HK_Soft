class CreateTourImages < ActiveRecord::Migration
  def change
    create_table :tour_images do |t|

      t.timestamps null: false
    end
  end
end
