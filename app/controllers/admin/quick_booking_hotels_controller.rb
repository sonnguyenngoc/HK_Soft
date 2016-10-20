class Admin::QuickBookingHotelsController < ApplicationController
  before_action :set_quick_booking_hotel, only: [:show, :edit, :update, :destroy]

  # GET /quick_booking_hotels
  # GET /quick_booking_hotels.json
  def index
    authorize! :read, QuickBookingHotel
    @quick_booking_hotels = QuickBookingHotel.order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
  end

  # GET /quick_booking_hotels/1
  # GET /quick_booking_hotels/1.json
  def show
  end

  # GET /quick_booking_hotels/new
  def new
    authorize! :create, QuickBookingHotel
    @quick_booking_hotel = QuickBookingHotel.new
  end

  # GET /quick_booking_hotels/1/edit
  def edit
    authorize! :update, @quick_booking_hotel
  end

  # POST /quick_booking_hotels
  # POST /quick_booking_hotels.json
  def create
    authorize! :create, QuickBookingHotel
    @quick_booking_hotel = QuickBookingHotel.new(quick_booking_hotel_params)

    respond_to do |format|
      if @quick_booking_hotel.save
        format.html { redirect_to @quick_booking_hotel, notice: 'Quick booking hotel was successfully created.' }
        format.json { render :show, status: :created, location: @quick_booking_hotel }
      else
        format.html { render :new }
        format.json { render json: @quick_booking_hotel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quick_booking_hotels/1
  # PATCH/PUT /quick_booking_hotels/1.json
  def update
    authorize! :update, @quick_booking_hotel
    respond_to do |format|
      if @quick_booking_hotel.update(quick_booking_hotel_params)
        format.html { redirect_to @quick_booking_hotel, notice: 'Quick booking hotel was successfully updated.' }
        format.json { render :show, status: :ok, location: @quick_booking_hotel }
      else
        format.html { render :edit }
        format.json { render json: @quick_booking_hotel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quick_booking_hotels/1
  # DELETE /quick_booking_hotels/1.json
  def destroy
    authorize! :delete, @quick_booking_hotel
    @quick_booking_hotel.destroy
    
    render nothing:true
    flash[:notice] = 'Xóa thông tin đặt khách sạn nhanh thành công.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quick_booking_hotel
      @quick_booking_hotel = QuickBookingHotel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quick_booking_hotel_params
      params.require(:quick_booking_hotel).permit(:name, :phone, :email, :passport, :hotel_name, :location, :date_from, :date_to, :number, :adult, :child, :message)
    end
end
