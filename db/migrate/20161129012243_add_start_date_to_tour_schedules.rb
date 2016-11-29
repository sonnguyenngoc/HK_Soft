class AddStartDateToTourSchedules < ActiveRecord::Migration
  def change
    add_column :tour_schedules, :start_date, :datetime
  end
end
