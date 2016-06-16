class Project < ActiveRecord::Base
    mount_uploader :image_url, ProjectUploader
    
    has_and_belongs_to_many :project_categories
    has_and_belongs_to_many :program_languages
    has_many :project_images, dependent: :destroy
    accepts_nested_attributes_for :project_images, :reject_if => lambda { |a| a[:image_url].blank? }, :allow_destroy => true
end
