class ProjectImage < ActiveRecord::Base
    mount_uploader :image_url, ProjectUploader
end
