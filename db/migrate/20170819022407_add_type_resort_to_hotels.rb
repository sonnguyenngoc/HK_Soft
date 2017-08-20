class AddTypeResortToHotels < ActiveRecord::Migration
  def change
    add_column :hotels, :type_resort, :string
  end
end
