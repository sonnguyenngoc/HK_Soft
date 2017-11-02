class HotelArea < ActiveRecord::Base
    validates :name, presence: true
    validates :name, :uniqueness => {:allow_blank => true}
    
    def self.get_hotel_areas
        self.order("name ASC")
    end
    
    #Filter, Sort
    def self.search(params)
      records = self.order("created_at DESC")
      
      return records   
    end
end
