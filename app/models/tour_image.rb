class TourImage < ActiveRecord::Base
    mount_uploader :image_url, TourImageUploader
end
