class AddFromDateAndToDateToBookingTours < ActiveRecord::Migration
  def change
    add_column :booking_tours, :from_date, :datetime
    add_column :booking_tours, :to_date, :datetime
  end
end
