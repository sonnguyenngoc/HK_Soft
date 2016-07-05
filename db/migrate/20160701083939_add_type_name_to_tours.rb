class AddTypeNameToTours < ActiveRecord::Migration
  def change
    add_column :tours, :type_name, :string
  end
end
