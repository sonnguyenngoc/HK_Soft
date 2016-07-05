class AddFromDateAndToDateAndDepartAndArriveAndSeatToTourSchedules < ActiveRecord::Migration
  def change
    add_column :tour_schedules, :from_date, :datetime
    add_column :tour_schedules, :to_date, :datetime
    add_column :tour_schedules, :depart, :string
    add_column :tour_schedules, :arrive, :string
    add_column :tour_schedules, :seat, :decimal
  end
end
