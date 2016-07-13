class CreateTourSchedules < ActiveRecord::Migration
  def change
    create_table :tour_schedules do |t|

      t.timestamps null: false
    end
  end
end
