class TourGroupsController < ApplicationController
  # POST /tour_groups
  # POST /tour_groups.json
  def create
    @tour_group = TourGroup.new(tour_group_params)

    respond_to do |format|
      if @tour_group.save
        #TourGroupMailer.tour_group_email(@tour_group).deliver_now
        format.html { redirect_to tour_group_thankyou_path }
      end
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def tour_group_params
      params.require(:tour_group).permit(:name, :email, :phone, :passport, :tour_name, :number, :standard_hotel, :date_from, :date_to, :price, :message, :address_from)
    end
end
