class CreateBookingVisas < ActiveRecord::Migration
  def change
    create_table :booking_visas do |t|
      t.string :full_name
      t.string :email
      t.string :phone
      t.string :address
      t.string :passport
      t.string :cmnd_number
      t.datetime :date_of_issue
      t.string :place_of_issue
      t.string :country_to
      t.string :visa_type

      t.timestamps null: false
    end
  end
end
