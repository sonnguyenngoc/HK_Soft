class AddSurcharge1AndSurcharge2ToTours < ActiveRecord::Migration
  def change
    add_column :tours, :surcharge_1, :decimal
    add_column :tours, :surcharge_2, :decimal
  end
end
