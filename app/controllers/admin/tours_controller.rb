class Admin::ToursController < ApplicationController
  before_action :set_tour, only: [:copy, :show, :edit, :update, :destroy]

  # GET /tours
  # GET /tours.json
  def index
    authorize! :read, Tour
    @tours = Tour.order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
  end

  # GET /tours/1
  # GET /tours/1.json
  def show
  end

  # GET /tours/new
  def new
    authorize! :create, Tour
    @tour = Tour.new
    30.times do
      @tour.tour_schedules.build
    end
    30.times do
      @tour.tour_images.build
    end
    5.times do
      @tour.tour_highlights.build
    end
  end

  # GET /tours/1/edit
  def edit
    authorize! :update, @tour
    (30+@tour.tour_schedules.count).times do
      @tour.tour_schedules.build
    end
    (30-@tour.tour_images.count).times do
      @tour.tour_images.build
    end
    (5-@tour.tour_highlights.count).times do
      @tour.tour_highlights.build
    end
  end

  # POST /tours
  # POST /tours.json
  def create
    authorize! :create, Tour
    @tour = Tour.new(tour_params)
    
    # create transportation
    @tour.transportation = nil if params[:tour][:transportation].present?
    @tour.transportation = params[:tour][:transportation].join(",") if params[:tour][:transportation].present?
    
    # create services
    @tour.services = nil if params[:tour][:services].present?
    @tour.services = params[:tour][:services].join(",") if params[:tour][:services].present?

    respond_to do |format|
      if @tour.save
        format.html { redirect_to edit_admin_tour_path(@tour.id), notice: 'Tạo mới tour du lịch thành công.' }
        format.json { render :show, status: :created, location: @tour }
      else
        format.html { render :new }
        format.json { render json: @tour.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tours/1
  # PATCH/PUT /tours/1.json
  def update
    authorize! :update, @tour
    # create transportation
    @tour.transportation = nil if params[:tour][:transportation].present?
    @tour.transportation = params[:tour][:transportation].join(",") if params[:tour][:transportation].present?
    
    # update services
    @tour.services = nil if params[:tour][:services].present?
    @tour.services = params[:tour][:services].join(",") if params[:tour][:services].present?
    
    respond_to do |format|
      if @tour.update(tour_params)
        format.html { redirect_to edit_admin_tour_path(@tour.id), notice: 'Chỉnh sửa tour du lịch thành công.' }
        format.json { render :show, status: :ok, location: @tour }
      else
        format.html { render :edit }
        format.json { render json: @tour.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tours/1
  # DELETE /tours/1.json
  def destroy
    authorize! :delete, @tour
    @tour.destroy
    
    render nothing:true
    flash[:notice] = 'Xóa tour du lịch thành công.'
  end
  
  def hidden
    @tour = Tour.find(params[:id])
    @tour.hidden = true
    @tour.save
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Ẩn tour thành công.' }
      format.json { head :no_content }
    end
  end
  
  def copy
    @new_tour = @tour.copy
    respond_to do |format|
      format.html { redirect_to edit_admin_tour_path(@new_tour.id), notice: 'Copy tour thành công.' }
      format.json { head :no_content }
    end
  end
  
  def un_hidden
    @tour = Tour.find(params[:id])
    @tour.hidden = false
    @tour.save
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Hiện tour thành công.' }
      format.json { head :no_content }
    end
  end
  
  def approve
    @tour = Tour.find(params[:id])
    authorize! :approve, @tour
    @tour.approved = true
    @tour.save
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Duyệt tour du lịch thành công.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tour
      @tour = Tour.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tour_params
      params.require(:tour).permit(:image_url, :tab_content_1, :tab_content_2, :tab_content_3, :tab_content_4, :meta_keywords, :meta_description, :approved, :article_category_id, :type_name, :name, :description, :content, :is_sale, :is_hot, :is_new_year, :discount_percent, :new_price, :time_line, :old_price, :surcharge_1, :surcharge_2, :services, :duration, :position, :hotel, :transportation, tour_schedules_attributes: [:id, :from_date, :to_date, :depart, :arrive, :seat, :_destroy], tour_highlights_attributes: [:id, :title, :_destroy], tour_images_attributes: [:id, :image_url, :_destroy])
    end
end
