class AddFbSharedToProducts < ActiveRecord::Migration
  def change
    add_column :products, :fb_shared, :boolean, default: false 
  end
end
