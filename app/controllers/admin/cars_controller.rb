class Admin::CarsController < ApplicationController
  before_action :set_car, only: [:show, :edit, :update, :destroy]

  # GET /cars
  # GET /cars.json
  def index
    authorize! :read, Car
    @cars = Car.all.paginate(:page => params[:page], :per_page => 10)
  end

  # GET /cars/1
  # GET /cars/1.json
  def show
  end

  # GET /cars/new
  def new
    authorize! :create, Car
    @car = Car.new
  end

  # GET /cars/1/edit
  def edit
    authorize! :update, @car
  end

  # POST /cars
  # POST /cars.json
  def create
    authorize! :create, Car
    @car = Car.new(car_params)

    respond_to do |format|
      if @car.save
        format.html { redirect_to edit_admin_car_path(@car.id), notice: 'Tạo mới thông tin xe thành công.' }
        format.json { render :show, status: :created, location: @car }
      else
        format.html { render :new }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cars/1
  # PATCH/PUT /cars/1.json
  def update
    authorize! :update, @car
    respond_to do |format|
      if @car.update(car_params)
        format.html { redirect_to edit_admin_car_path(@car.id), notice: 'Chỉnh sửa thông tin xe thành công.' }
        format.json { render :show, status: :ok, location: @car }
      else
        format.html { render :edit }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

   # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @car.destroy
    
    render nothing:true
    flash[:notice] = 'Xóa thông tin xe thành công.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_car
      @car = Car.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def car_params
      params.require(:car).permit(:image_url, :name, :price, :description, :content, :manufacturer_id, :article_category_id)
    end
end
