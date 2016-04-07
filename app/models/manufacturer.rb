class Manufacturer < ActiveRecord::Base
  mount_uploader :image_url, ManufacturerUploader
  validates :name, presence: true
  validates :image_url, allow_blank: true, format: {
    with: %r{\.(gif|jpg|png)\Z}i,
    message: 'must be a URL for GIF, JPG or PNG image.'
  }

end
