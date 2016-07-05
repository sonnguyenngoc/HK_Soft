class HotelRoom < ActiveRecord::Base
     mount_uploader :image_url, HotelUploader
end
