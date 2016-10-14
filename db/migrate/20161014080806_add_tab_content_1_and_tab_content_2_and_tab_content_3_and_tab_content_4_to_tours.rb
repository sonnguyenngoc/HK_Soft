class AddTabContent1AndTabContent2AndTabContent3AndTabContent4ToTours < ActiveRecord::Migration
  def change
    add_column :tours, :tab_content_1, :text
    add_column :tours, :tab_content_2, :text
    add_column :tours, :tab_content_3, :text
    add_column :tours, :tab_content_4, :text
  end
end
