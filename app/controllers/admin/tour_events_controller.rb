class Admin::TourEventsController < ApplicationController
  before_action :set_tour_event, only: [:approve, :inactive, :show, :edit, :update, :destroy]

  # GET /tour_events
  # GET /tour_events.json
  def index
    authorize! :read, TourEvent
    @tour_events = TourEvent.order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
  end

  # GET /tour_events/1
  # GET /tour_events/1.json
  def show
  end

  # GET /tour_events/new
  def new
    authorize! :create, TourEvent
    @tour_event = TourEvent.new
    8.times do
      @tour_event.tour_event_details.build
    end
  end

  # GET /tour_events/1/edit
  def edit
    authorize! :update, @tour_event
    (8-@tour_event.tour_event_details.count).times do
      @tour_event.tour_event_details.build
    end
  end

  # POST /tour_events
  # POST /tour_events.json
  def create
    authorize! :create, TourEvent
    @tour_event = TourEvent.new(tour_event_params)

    respond_to do |format|
      if @tour_event.save
        format.html { redirect_to edit_admin_tour_event_path(@tour_event.id), notice: 'Tạo mới nhóm tour thành công.' }
        format.json { render :show, status: :created, location: @tour_event }
      else
        format.html { render :new }
        format.json { render json: @tour_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tour_events/1
  # PATCH/PUT /tour_events/1.json
  def update
    authorize! :update, @tour_event
    respond_to do |format|
      if @tour_event.update(tour_event_params)
        format.html { redirect_to edit_admin_tour_event_path(@tour_event.id), notice: 'Chỉnh sửa nhóm tour thành công.' }
        format.json { render :show, status: :ok, location: @tour_event }
      else
        format.html { render :edit }
        format.json { render json: @tour_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tour_events/1
  # DELETE /tour_events/1.json
  def destroy
    authorize! :delete, @tour_event
    @tour_event.destroy
    
    render nothing:true
    flash[:notice] = 'Xóa nhóm tour thành công.'
  end
  
  def approve
    authorize! :update, @tour_event
    @tour_event.set_active
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Duyệt nhóm tour thành công.' }
      format.json { head :no_content }
    end
  end
  
  def inactive
    authorize! :update, @tour_event
    @tour_event.set_inactive
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Ẩn nhóm tour thành công.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tour_event
      @tour_event = TourEvent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tour_event_params
      params.require(:tour_event).permit(:title, :description,
                                         tour_event_details_attributes: [:id, :tour_id, :_destroy])
    end
end
