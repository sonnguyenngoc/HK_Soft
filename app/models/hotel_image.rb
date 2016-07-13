class HotelImage < ActiveRecord::Base
    mount_uploader :image_url, HotelUploader
end
