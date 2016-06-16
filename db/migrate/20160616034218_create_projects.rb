class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :image_url
      t.string :author
      t.string :name
      t.datetime :start_date
      t.datetime :end_date
      t.text :description
      t.string :website

      t.timestamps null: false
    end
  end
end
