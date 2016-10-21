class Admin::CountriesController < ApplicationController
  before_action :set_country, only: [:show, :edit, :update, :destroy]

  # GET /countries
  # GET /countries.json
  def index
    authorize! :read, Country
    @countries = Country.order("name asc").paginate(:page => params[:page], :per_page => 10)
  end

  # GET /countries/1
  # GET /countries/1.json
  def show
  end

  # GET /countries/new
  def new
    authorize! :create, Country
    @country = Country.new
  end

  # GET /countries/1/edit
  def edit
    authorize! :update, @country
  end

  # POST /countries
  # POST /countries.json
  def create
    authorize! :create, Country
    @country = Country.new(country_params)

    respond_to do |format|
      if @country.save
        format.html { redirect_to edit_admin_country_path(@country.id), notice: 'Tạo thông tin quốc gia thành công.' }
        format.json { render :show, status: :created, location: @country }
      else
        format.html { render :new }
        format.json { render json: @country.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /countries/1
  # PATCH/PUT /countries/1.json
  def update
    authorize! :update, @country
    respond_to do |format|
      if @country.update(country_params)
        format.html { redirect_to edit_admin_country_path(@country.id), notice: 'Cập nhật thông tin quốc gia thành công.' }
        format.json { render :show, status: :ok, location: @country }
      else
        format.html { render :edit }
        format.json { render json: @country.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /countries/1
  # DELETE /countries/1.json
  def destroy
    authorize! :delete, @country
    @country.destroy
    
    render nothing:true
    flash[:notice] = 'Xóa thông tin quốc gia thành công.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_country
      @country = Country.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def country_params
      params.require(:country).permit(:name, :description)
    end
end
