class Admin::BookingCarsController < ApplicationController
  before_action :set_booking_car, only: [:show, :edit, :update, :destroy]

  # GET /booking_cars
  # GET /booking_cars.json
  def index
    authorize! :read, BookingCar
    @booking_cars = BookingCar.order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
  end

  # GET /booking_cars/1
  # GET /booking_cars/1.json
  def show
  end

  # GET /booking_cars/new
  def new
    authorize! :create, BookingCar
    @booking_car = BookingCar.new
  end

  # GET /booking_cars/1/edit
  def edit
    authorize! :update, @booking_car
  end

  # POST /booking_cars
  # POST /booking_cars.json
  def create
    authorize! :create, BookingCar
    @booking_car = BookingCar.new(booking_car_params)

    respond_to do |format|
      if @booking_car.save
        format.html { redirect_to @booking_car, notice: 'Booking car was successfully created.' }
        format.json { render :show, status: :created, location: @booking_car }
      else
        format.html { render :new }
        format.json { render json: @booking_car.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /booking_cars/1
  # PATCH/PUT /booking_cars/1.json
  def update
    authorize! :update, @booking_car
    respond_to do |format|
      if @booking_car.update(booking_car_params)
        format.html { redirect_to @booking_car, notice: 'Booking car was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking_car }
      else
        format.html { render :edit }
        format.json { render json: @booking_car.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /booking_cars/1
  # DELETE /booking_cars/1.json
  def destroy
    authorize! :delete, @booking_car
    @booking_car.destroy
    
    render nothing:true
    flash[:notice] = 'Xóa thông tin xe thành công.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking_car
      @booking_car = BookingCar.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def booking_car_params
      params.require(:booking_car).permit(:full_name, :address, :phone, :email, :passport, :message, :date_from, :date_to, :address_from, :address_to, :price)
    end
end
