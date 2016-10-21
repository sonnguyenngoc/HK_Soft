class Tour < ActiveRecord::Base
    mount_uploader :image_url, TourImageUploader
    has_many :tour_schedules
    has_many :tour_highlights
    has_many :tour_images
    belongs_to :article_category
    accepts_nested_attributes_for :tour_highlights, :reject_if => lambda { |a| a[:title].blank? }, :allow_destroy => true
    accepts_nested_attributes_for :tour_schedules, :reject_if => lambda { |a| a[:from_date].blank? }, :allow_destroy => true
    accepts_nested_attributes_for :tour_images, :reject_if => lambda { |a| a[:image_url].blank? && a[:id].blank? }, :allow_destroy => true
    
    def self.get_discount_tours
        self.where("tours.is_sale = true and tours.hidden = false").order("created_at DESC")
    end
    
    def self.get_hot_tours
        self.where("tours.is_hot = true and tours.hidden = false").order("created_at DESC")
    end
    
    def url_friendly
        self.name.unaccent.downcase.to_s.gsub(/[^0-9a-z ]/i, '').gsub(/ +/i, '-').strip
    end
    
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
    
    def self.get_tour_listing(params)
        records = self.where("tours.hidden = false").order("created_at DESC")
        records = records.where(hidden: false)
        
        if params[:name].present?
            records = records.where("LOWER(tours.name) LIKE ?", "%#{params[:name].downcase.strip}%")
        end 
        
        if params[:type_name].present?
            records = records.where(type_name: params[:type_name])
        end 
        
        if params[:from_date].present?
            records = records.joins(:tour_schedules).where("tour_schedules.from_date = ?", params[:from_date])
        end 
        
        return records
    end
    
    def self.get_deal_tours_listing
        self.where("tours.is_sale = true and tours.hidden = false").order("created_at DESC")
    end
    
    def self.get_new_year_tours_listing
        self.where("tours.is_new_year = true and tours.hidden = false").order("created_at DESC")
    end
    
    def self.get_hot_tours_listing
        self.where("tours.is_hot = true and tours.hidden = false").order("created_at DESC")
    end
    
    def get_lastest_tour_from_date
        records = self.tour_schedules.where("from_date > ?", Time.now)
        if records.count > 0
            if !records.first.from_date.nil?
                records = records.order("created_at ASC").first.from_date.strftime("%d/%m/%Y")
            else
                records = nil
            end
        else
            records =  nil
        end
        
        return records
    end
    
    def get_lastest_tour_to_date
        records = self.tour_schedules.where("from_date > ?", Time.now)
        if records.count > 0
            if !records.first.to_date.nil?
                records = records.order("created_at ASC").first.to_date.strftime("%d/%m/%Y")
            else
                records = nil
            end
        else
            records =  nil
        end
        
        return records
    end
    
    def get_count_tour_schedules
        self.tour_schedules.where("from_date > ?", Time.now).count
    end
    
    def self.get_domestic_tour(params)
        records = self.where(type_name: "Tour Trong Nước").order("created_at DESC")
        records = records.where(hidden: false)
        
        if params[:name].present?
            records = records.where("LOWER(tours.name) LIKE ?", "%#{params[:name].downcase.strip}%")
        end
        
        if params[:from_date].present?
            records = records.joins(:tour_schedules).where("tour_schedules.from_date = ?", params[:from_date])
        end
        
        if params[:article_category_id].present?
            records = records.where(article_category_id: params[:article_category_id])
        end
        
        return records
    end
    
    def self.get_foreign_tour(params)
        records = self.where(type_name: "Tour Nước Ngoài").order("created_at DESC")
        records = records.where(hidden: false)
        
        if params[:name].present?
            records = records.where("LOWER(tours.name) LIKE ?", "%#{params[:name].downcase.strip}%")
        end
        
        if params[:from_date].present?
            records = records.joins(:tour_schedules).where("tour_schedules.from_date = ?", params[:from_date])
        end
        
        if params[:article_category_id].present?
            records = records.where(article_category_id: params[:article_category_id])
        end
        
        return records
    end
    
    def self.get_lastest_domestic_tour
        self.where(type_name: "Tour Trong Nước").where(hidden: false).order("created_at DESC").first(8)
    end
    
    def self.get_lastest_foreign_tour
        self.where(type_name: "Tour Nước Ngoài").where(hidden: false).order("created_at DESC").first(8)
    end
    
    def self.get_tour_packages(params)
        records = self.order("created_at DESC")
        records = records.where(hidden: false)
        
        if params[:search_name].present?
            records = records.where("LOWER(tours.name) LIKE ?", "%#{params[:search_name].downcase.strip}%")
        end
        
        if params[:search_from_date].present?
            records = records.joins(:tour_schedules).where("tour_schedules.from_date = ?", params[:search_from_date])
        end
        
        if params[:tour_packages_id].present?
            records = records.where(article_category_id: params[:tour_packages_id])
        end
        
        return records
    end
    
    def self.get_related_tours(article_category_id)
        records = self.order("created_at DESC")
        records = records.where(hidden: false)
        
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
    
    def copy
        new_tour = self.dup
        new_tour.name += " (Copy)"
        CopyCarrierwaveFile::CopyFileService.new(self, new_tour, :image_url).set_file
        # :image_url represents mount point (field)
        new_tour.save
        
        # copy tour schedules - 1-n
        self.tour_schedules.each do |ts|
            new_ts = ts.dup
            new_tour.tour_schedules << new_ts
        end
        
        # copy tour images - 1-n
        self.tour_images.each do |ti|
            new_ti = ti.dup
            CopyCarrierwaveFile::CopyFileService.new(ti, new_ti, :image_url).set_file
            new_tour.tour_images << new_ti
        end
        
        return new_tour
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
