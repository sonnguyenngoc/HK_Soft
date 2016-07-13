class AddMessageToBookingVisas < ActiveRecord::Migration
  def change
    add_column :booking_visas, :message, :text
  end
end
