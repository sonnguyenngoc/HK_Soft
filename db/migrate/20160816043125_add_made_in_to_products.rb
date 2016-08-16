class AddMadeInToProducts < ActiveRecord::Migration
  def change
    add_column :products, :made_in, :string
  end
end
