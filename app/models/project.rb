class Project < ActiveRecord::Base
    validates :author, :name, :start_date, :end_date, presence: true
    mount_uploader :image_url, ProjectUploader
    
    has_and_belongs_to_many :project_categories
    has_and_belongs_to_many :program_languages
    has_many :project_images, dependent: :destroy
    accepts_nested_attributes_for :project_images, :reject_if => lambda { |a| a[:image_url].blank? }, :allow_destroy => true
    
    def get_category_ids
        "["+(self.project_categories.map{|item| '"a'+item.id.to_s+'"'}).join(",")+"]"
    end
    
end
