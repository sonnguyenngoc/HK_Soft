class BookingTour < ActiveRecord::Base
    belongs_to :tour
    belongs_to :tour_schedule
    before_validation :update_tour_info
    validates :full_name, :address, :phone, :email, :child, :child_2, :child_3, :adult, presence: true
    validates_format_of :email, :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/
    
    def update_tour_info
        self.tour_name = tour.name
        self.price = tour.new_price
        if tour_schedule_id.present?
            self.from_date = tour_schedule.from_date
            self.to_date = tour_schedule.to_date
        end
    end
end
