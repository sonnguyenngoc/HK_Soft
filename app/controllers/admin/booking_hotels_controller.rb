class Admin::BookingHotelsController < ApplicationController
  before_action :set_booking_hotel, only: [:show, :edit, :update, :destroy]

  # GET /booking_hotels
  # GET /booking_hotels.json
  def index
    @booking_hotels = BookingHotel.all
  end

  # GET /booking_hotels/1
  # GET /booking_hotels/1.json
  def show
  end

  # GET /booking_hotels/new
  def new
    @booking_hotel = BookingHotel.new
  end

  # GET /booking_hotels/1/edit
  def edit
  end

  # POST /booking_hotels
  # POST /booking_hotels.json
  def create
    @booking_hotel = BookingHotel.new(booking_hotel_params)

    respond_to do |format|
      if @booking_hotel.save
        format.html { redirect_to @booking_hotel, notice: 'Booking hotel was successfully created.' }
        format.json { render :show, status: :created, location: @booking_hotel }
      else
        format.html { render :new }
        format.json { render json: @booking_hotel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /booking_hotels/1
  # PATCH/PUT /booking_hotels/1.json
  def update
    respond_to do |format|
      if @booking_hotel.update(booking_hotel_params)
        format.html { redirect_to @booking_hotel, notice: 'Booking hotel was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking_hotel }
      else
        format.html { render :edit }
        format.json { render json: @booking_hotel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /booking_hotels/1
  # DELETE /booking_hotels/1.json
  def destroy
    @booking_hotel.destroy
    respond_to do |format|
      format.html { redirect_to booking_hotels_url, notice: 'Booking hotel was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking_hotel
      @booking_hotel = BookingHotel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def booking_hotel_params
      params.require(:booking_hotel).permit(:hotel_id, :full_name, :phone, :email, :address, :passport, :date_from, :date_to, :adult, :child, :room_number, :hotel_room_id, :hotel_room_name, :price, :message)
    end
end
