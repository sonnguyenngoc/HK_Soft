class ProjectCategory < ActiveRecord::Base
    validates :name, presence: true
    has_and_belongs_to_many :projects
    
    def self.get_all_categories
        self.all.order("name ASC")
    end
end
