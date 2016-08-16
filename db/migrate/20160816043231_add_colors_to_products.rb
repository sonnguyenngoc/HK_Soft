class AddColorsToProducts < ActiveRecord::Migration
  def change
    add_column :products, :colors, :string
  end
end
