class AddColorToOrderDetails < ActiveRecord::Migration
  def change
    add_column :order_details, :color, :string
  end
end
