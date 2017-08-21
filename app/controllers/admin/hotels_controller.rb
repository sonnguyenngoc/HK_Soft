class Admin::HotelsController < ApplicationController
  before_action :set_hotel, only: [:show, :edit, :update, :destroy]

  # GET /hotels
  # GET /hotels.json
  def index
    authorize! :read, Hotel
    @hotels = Hotel.paginate(:page => params[:page], :per_page => 10).order("created_at DESC")
  end

  # GET /hotels/1
  # GET /hotels/1.json
  def show
  end

  # GET /hotels/new
  def new
    authorize! :create, Hotel
    @hotel = Hotel.new
    30.times do
      @hotel.hotel_images.build
    end
    30.times do
      @hotel.hotel_rooms.build
    end
  end

  # GET /hotels/1/edit
  def edit
    authorize! :update, @hotel
    (30-@hotel.hotel_images.count).times do
      @hotel.hotel_images.build
    end
    (30-@hotel.hotel_rooms.count).times do
      @hotel.hotel_rooms.build
    end
  end

  # POST /hotels
  # POST /hotels.json
  def create
    authorize! :create, Hotel
    @hotel = Hotel.new(hotel_params)
    # create services
    @hotel.services = nil if params[:hotel][:services].present?
    @hotel.services = params[:hotel][:services].join(",") if params[:hotel][:services].present?

    respond_to do |format|
      if @hotel.save
        format.html { redirect_to edit_admin_hotel_path(@hotel.id), notice: 'Tạo mới khách sạn thành công.' }
        format.json { render :show, status: :created, location: @hotel }
      else
        format.html { render :new }
        format.json { render json: @hotel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hotels/1
  # PATCH/PUT /hotels/1.json
  def update
    authorize! :update, @hotel
    # create services
    @hotel.services = nil if params[:hotel][:services].present?
    @hotel.services = params[:hotel][:services].join(",") if params[:hotel][:services].present?
    
    respond_to do |format|
      if @hotel.update(hotel_params)
        format.html { redirect_to edit_admin_hotel_path(@hotel.id), notice: 'Chỉnh sửa khách sạn thành công.' }
        format.json { render :show, status: :ok, location: @hotel }
      else
        format.html { render :edit }
        format.json { render json: @hotel.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # DELETE /tours/1
  # DELETE /tours/1.json
  def destroy
    authorize! :delete, @hotel
    @hotel.destroy
    
    render nothing:true
    flash[:notice] = 'Xóa khách sạn thành công.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hotel
      @hotel = Hotel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hotel_params
      params.require(:hotel).permit(:image_url, :type_resort, :area_name, :name, :hotel_type, :address, :position, :area_id, :avg_price, :services, :description, :content, hotel_rooms_attributes: [:id, :image_url, :room_type, :description, :price, :people_number, :bed_number, :_destroy], hotel_images_attributes: [:id, :image_url, :_destroy])
    end
end
