class Car < ActiveRecord::Base
    mount_uploader :image_url, ManufacturerUploader
    
    belongs_to :manufacturer
    belongs_to :article_category
    
    def url_friendly
        self.name.unaccent.downcase.to_s.gsub(/[^0-9a-z ]/i, '').gsub(/ +/i, '-').strip
    end
    
    def self.get_all_cars(params)
        records = self.order("created_at DESC")
        
        if params[:article_category_id].present?
            records = records.where(article_category_id: params[:article_category_id])
        end 
        
        if params[:manufacturer_id].present?
            records = records.where(manufacturer_id: params[:manufacturer_id])
        end 
        
        return records
    end
    
    def self.get_lastest_cars
        self.order("created_at DESC").first(8)
    end
    
    def self.get_car_categories(params)
        records = Car.order("created_at DESC")
        records = records.where(article_category_id: params[:car_category_id])
        
        return records
    end
end
