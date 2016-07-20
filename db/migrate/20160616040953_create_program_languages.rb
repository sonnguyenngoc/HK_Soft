class CreateProgramLanguages < ActiveRecord::Migration
  def change
    create_table :program_languages do |t|
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end
