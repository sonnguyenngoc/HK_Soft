class AddTourIdToTourSchedules < ActiveRecord::Migration
  def change
    add_column :tour_schedules, :tour_id, :integer
  end
end
