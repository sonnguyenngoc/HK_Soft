class TourGroupController < ApplicationController
  def booking_tour_group
    @tour_group = TourGroup.new
  end
  
  def tour_group_thankyou
  end
end
