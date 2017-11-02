class Admin::HotelAreasController < ApplicationController
  before_action :set_hotel_area, only: [:show, :edit, :update, :destroy]

  # GET /hotel_areas
  # GET /hotel_areas.json
  def index
    # authorize
    authorize! :read, HotelArea
    
    @hotel_areas = HotelArea.search(params).paginate(:page => params[:page], :per_page => 10)
  end

  # GET /hotel_areas/1
  # GET /hotel_areas/1.json
  def show
  end

  # GET /hotel_areas/new
  def new
    # authorize
    authorize! :create, HotelArea
    
    @hotel_area = HotelArea.new
  end

  # GET /hotel_areas/1/edit
  def edit
    # authorize
    authorize! :update, @hotel_area
  end

  # POST /hotel_areas
  # POST /hotel_areas.json
  def create
    # authorize
    authorize! :create, HotelArea
    @hotel_area = HotelArea.new(hotel_area_params)

    respond_to do |format|
      if @hotel_area.save
        format.html { redirect_to edit_admin_hotel_area_path(@hotel_area.id), notice: 'Tạo mới khu vực khách sạn thành công.' }
        format.json { render :show, status: :created, location: @hotel_area }
      else
        format.html { render :new }
        format.json { render json: @hotel_area.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hotel_areas/1
  # PATCH/PUT /hotel_areas/1.json
  def update
    # authorize
    authorize! :update, @hotel_area
    
    respond_to do |format|
      if @hotel_area.update(hotel_area_params)
        format.html { redirect_to edit_admin_hotel_area_path(@hotel_area.id), notice: 'Cập nhật khu vực khách sạn thành công.' }
        format.json { render :show, status: :ok, location: @hotel_area }
      else
        format.html { render :edit }
        format.json { render json: @hotel_area.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hotel_areas/1
  # DELETE /hotel_areas/1.json
  def destroy
    authorize! :delete, @hotel_area
    @hotel_area.destroy
    
    render nothing:true
    flash[:notice] = 'Xóa khu vực khách hàng thành công.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hotel_area
      @hotel_area = HotelArea.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hotel_area_params
      params.require(:hotel_area).permit(:name)
    end
end
