class Hotel < ActiveRecord::Base
    mount_uploader :image_url, HotelUploader
    belongs_to :area
    has_many :hotel_images
    has_many :hotel_rooms
    accepts_nested_attributes_for :hotel_images, :reject_if => lambda { |a| a[:image_url].blank? && a[:id].blank? }, :allow_destroy => true
    accepts_nested_attributes_for :hotel_rooms, :reject_if => lambda { |a| a[:image_url].blank? && a[:id].blank? }, :allow_destroy => true
    
    def url_friendly
        self.name.unaccent.downcase.to_s.gsub(/[^0-9a-z ]/i, '').gsub(/ +/i, '-').strip
    end
    
    def get_services
        arr = []
        services.to_s.split(",").each do |st|
          arr << st
        end
        return arr    
    end
    
    def self.service_listing
        [
            "t_24_hour_reception",
            "t_24_hour_room_service",
            "airport_shuttles_service",
            "childcare_service",
            "bar",
            "convention_center",
            "car_rentals",
            "coffee_shops",
            "guides",
            "money_exchange",
            "elevator",
            "laundry_service",
            "luggage_storage",
            "meeting_room_devices",
            "bar_near_pool",
            "restaurant",
            "housekeeping",
            "safe",
            "travel_service",
            "beauty_salon",
            "smoking_room",
            "outdoor_pool",
            "massage",
            "sauna",
            "gym",
            "spa",
            "wifi",
            "outdoor_wifi",
            "car_park",
            "free_buffet_breakfast",
        ]
    end
    
    def self.language_listing
        [
            "vietnamese",
            "english",
            "japanese",
            "chinese",
        ]
    end
    
    def self.get_all_hotels(params)
        records = self.order("created_at DESC")
        
        if params[:hotel_type].present?
            records = records.where(hotel_type: params[:hotel_type])
        end 
        
        if params[:area_id].present?
            records = records.where(area_id: params[:area_id])
        end 
        
        return records
    end
end
