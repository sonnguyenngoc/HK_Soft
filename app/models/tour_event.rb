class TourEvent < ActiveRecord::Base
  has_many :tour_event_details, dependent: :destroy
  accepts_nested_attributes_for :tour_event_details, :reject_if => lambda { |a| a[:tour_id].blank? }, :allow_destroy => true
  
  def self.get_active_tour_events
    where(active: true).order("created_at DESC")
  end
  
  def set_active
    update_columns(active: true)
  end
  def set_inactive
    update_columns(active: false)
  end
end
