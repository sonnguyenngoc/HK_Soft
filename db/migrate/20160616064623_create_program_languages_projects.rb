class CreateProgramLanguagesProjects < ActiveRecord::Migration
  def change
    create_table :program_languages_projects do |t|
      t.integer :program_language_id
      t.integer :project_id

      t.timestamps null: false
    end
  end
end
