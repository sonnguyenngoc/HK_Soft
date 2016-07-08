class Admin::BookingVisasController < ApplicationController
  before_action :set_booking_visa, only: [:show, :edit, :update, :destroy]

  # GET /booking_visas
  # GET /booking_visas.json
  def index
    @booking_visas = BookingVisa.all
  end

  # GET /booking_visas/1
  # GET /booking_visas/1.json
  def show
  end

  # GET /booking_visas/new
  def new
    @booking_visa = BookingVisa.new
  end

  # GET /booking_visas/1/edit
  def edit
  end

  # POST /booking_visas
  # POST /booking_visas.json
  def create
    @booking_visa = BookingVisa.new(booking_visa_params)

    respond_to do |format|
      if @booking_visa.save
        format.html { redirect_to @booking_visa, notice: 'Booking visa was successfully created.' }
        format.json { render :show, status: :created, location: @booking_visa }
      else
        format.html { render :new }
        format.json { render json: @booking_visa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /booking_visas/1
  # PATCH/PUT /booking_visas/1.json
  def update
    respond_to do |format|
      if @booking_visa.update(booking_visa_params)
        format.html { redirect_to @booking_visa, notice: 'Booking visa was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking_visa }
      else
        format.html { render :edit }
        format.json { render json: @booking_visa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /booking_visas/1
  # DELETE /booking_visas/1.json
  def destroy
    @booking_visa.destroy
    respond_to do |format|
      format.html { redirect_to booking_visas_url, notice: 'Booking visa was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking_visa
      @booking_visa = BookingVisa.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def booking_visa_params
      params.require(:booking_visa).permit(:full_name, :email, :phone, :address, :passport, :cmnd_number, :date_of_issue, :place_of_issue, :country_to, :visa_type, :message)
    end
end
