class Car < ActiveRecord::Base
    mount_uploader :image_url, ManufacturerUploader
    
    belongs_to :manufacturer
    belongs_to :article_category
    
    
    def self.get_all_cars
        self.all.order("created_at DESC")
    end
    
    def self.get_car_categories(params)
        records = Car.order("created_at DESC")
        records = records.where(article_category_id: params[:car_category_id])
        
        return records
    end
end
