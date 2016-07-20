class ProgramLanguagesProject < ActiveRecord::Base
    belongs_to :project
    belongs_to :program_language
end
