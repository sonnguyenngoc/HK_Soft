class TourEventDetail < ActiveRecord::Base
  belongs_to :tour_event
  belongs_to :tour
end
