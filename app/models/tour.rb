class Tour < ActiveRecord::Base
    mount_uploader :image_url, TourImageUploader
    has_many :tour_schedules
    has_many :tour_images
    belongs_to :article_category
    accepts_nested_attributes_for :tour_schedules, :reject_if => lambda { |a| a[:from_date].blank? }, :allow_destroy => true
    accepts_nested_attributes_for :tour_images, :reject_if => lambda { |a| a[:image_url].blank? && a[:id].blank? }, :allow_destroy => true
    
    def get_transportations
        arr = []
        transportation.to_s.split(",").each do |st|
          arr << st
        end
        return arr    
    end
    
    def get_services
        arr = []
        services.to_s.split(",").each do |st|
          arr << st
        end
        return arr    
    end
    
    def self.get_tour_listing
        self.order("created_at DESC")
    end
    
    def get_lastest_tour_from_date
        self.tour_schedules.order("created_at ASC").first.from_date.strftime("%d/%m/%Y")
    end
    
    def get_lastest_tour_to_date
        self.tour_schedules.order("created_at ASC").first.to_date.strftime("%d/%m/%Y")
    end
    
    def get_count_tour_schedules
        self.tour_schedules.count
    end
    
    def self.get_domestic_tour
        self.where(type_name: "Tour Trong Nước").order("created_at DESC")
    end
    
    def self.get_foreign_tour
        self.where(type_name: "Tour Nước Ngoài").order("created_at DESC")
    end
    
    def self.get_tour_packages(params)
        records = Tour.order("created_at DESC")
        records = records.where(article_category_id: params[:tour_packages_id])
        
        return records
    end
    
    def self.get_related_tours(article_category_id)
        records = Tour.order("created_at DESC")
        records = records.where(article_category_id: article_category_id)
        
        return records.first(5)
    end
    
    def self.transportation_listing
        [
            "car",
            "trunk",
            "plane",
        ]
    end
    
    def self.service_listing
        [
            "entrance_fees",
            "food",
            "guides",
            "insurrance",
            "transportation",
            "hotel",
        ]
    end

end
