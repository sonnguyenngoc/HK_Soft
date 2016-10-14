class Gallery < ActiveRecord::Base
	mount_uploader :image_url, GalleryUploader
	has_many :gallery_images
	accepts_nested_attributes_for :gallery_images, :reject_if => lambda { |a| a[:image_url].blank? && a[:id].blank? }, :allow_destroy => true
end