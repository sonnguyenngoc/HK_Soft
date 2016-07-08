class Admin::BookingToursController < ApplicationController
  before_action :set_booking_tour, only: [:show, :edit, :update, :destroy]

  # GET /booking_tours
  # GET /booking_tours.json
  def index
    authorize! :read, BookingTour
    @booking_tours = BookingTour.order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
  end

  # GET /booking_tours/1
  # GET /booking_tours/1.json
  def show
  end

  # GET /booking_tours/new
  def new
    authorize! :create, BookingTour
    @booking_tour = BookingTour.new
  end

  # GET /booking_tours/1/edit
  def edit
    authorize! :update, @booking_tour
  end

  # POST /booking_tours
  # POST /booking_tours.json
  def create
    authorize! :create, BookingTour
    @booking_tour = BookingTour.new(booking_tour_params)

    respond_to do |format|
      if @booking_tour.save
        format.html { redirect_to @booking_tour, notice: 'Booking tour was successfully created.' }
        format.json { render :show, status: :created, location: @booking_tour }
      else
        format.html { render :new }
        format.json { render json: @booking_tour.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /booking_tours/1
  # PATCH/PUT /booking_tours/1.json
  def update
    authorize! :update, @booking_tour
    respond_to do |format|
      if @booking_tour.update(booking_tour_params)
        format.html { redirect_to @booking_tour, notice: 'Booking tour was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking_tour }
      else
        format.html { render :edit }
        format.json { render json: @booking_tour.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /booking_tours/1
  # DELETE /booking_tours/1.json
  def destroy
    authorize! :delete, @booking_tour
    @booking_plane.destroy
    
    render nothing:true
    flash[:notice] = 'Xóa thông tin đặt tour thành công.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking_tour
      @booking_tour = BookingTour.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def booking_tour_params
      params.require(:booking_tour).permit(:full_name, :address, :phone, :email, :passport, :tour_schedule_id, :adult, :child, :child_2, :child_3, :message, :tour_id, :tour_name, :price, :from_date, :to_date)
    end
end
