class HotToursController < ApplicationController
  def index
		@page_name = "Tour Hot"
    @tours = Tour.get_hot_tours_listing.paginate(page: params[:page], per_page: 12)
	end
end