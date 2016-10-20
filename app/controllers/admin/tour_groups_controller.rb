class Admin::TourGroupsController < ApplicationController
  before_action :set_tour_group, only: [:show, :edit, :update, :destroy]

  # GET /tour_groups
  # GET /tour_groups.json
  def index
    authorize! :read, TourGroup
    @tour_groups = TourGroup.order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
  end

  # GET /tour_groups/1
  # GET /tour_groups/1.json
  def show
  end

  # GET /tour_groups/new
  def new
    authorize! :create, TourGroup
    @tour_group = TourGroup.new
  end

  # GET /tour_groups/1/edit
  def edit
    authorize! :update, @tour_group
  end

  # POST /tour_groups
  # POST /tour_groups.json
  def create
    authorize! :create, TourGroup
    @tour_group = TourGroup.new(tour_group_params)

    respond_to do |format|
      if @tour_group.save
        format.html { redirect_to edit_admin_tour_group_path(@tour_group.id), notice: 'Tạo tour đoàn thành công.' }
        format.json { render :show, status: :created, location: @tour_group }
      else
        format.html { render :new }
        format.json { render json: @tour_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tour_groups/1
  # PATCH/PUT /tour_groups/1.json
  def update
    authorize! :update, @tour_group
    respond_to do |format|
      if @tour_group.update(tour_group_params)
        format.html { redirect_to edit_admin_tour_group_path(@tour_group.id), notice: 'Cập nhật tour đoàn thành công.' }
        format.json { render :show, status: :ok, location: @tour_group }
      else
        format.html { render :edit }
        format.json { render json: @tour_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tour_groups/1
  # DELETE /tour_groups/1.json
  def destroy
    authorize! :delete, @tour_group
    @tour_group.destroy
    
    render nothing:true
    flash[:notice] = 'Xóa tour đoàn thành công.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tour_group
      @tour_group = TourGroup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tour_group_params
      params.require(:tour_group).permit(:tour_name, :number, :date_from, :date_to, :price, :message, :address_from)
    end
end
