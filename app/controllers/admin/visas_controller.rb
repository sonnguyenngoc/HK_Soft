class Admin::VisasController < ApplicationController
  before_action :set_visa, only: [:show, :edit, :update, :destroy]

  # GET /visas
  # GET /visas.json
  def index
    authorize! :read, Visa
    @visas = Visa.order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
  end

  # GET /visas/1
  # GET /visas/1.json
  def show
  end

  # GET /visas/new
  def new
    authorize! :create, Visa
    @visa = Visa.new
  end

  # GET /visas/1/edit
  def edit
    authorize! :update, @visa
  end

  # POST /visas
  # POST /visas.json
  def create
    authorize! :create, Visa
    @visa = Visa.new(visa_params)

    respond_to do |format|
      if @visa.save
        format.html { redirect_to edit_admin_visa_path(@visa.id), notice: 'Tạo thông tin visa thành công.' }
        format.json { render :show, status: :created, location: @visa }
      else
        format.html { render :new }
        format.json { render json: @visa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /visas/1
  # PATCH/PUT /visas/1.json
  def update
    authorize! :update, @visa
    respond_to do |format|
      if @visa.update(visa_params)
        format.html { redirect_to edit_admin_visa_path(@visa.id), notice: 'Cập nhật thông tin visa thành công.' }
        format.json { render :show, status: :ok, location: @visa }
      else
        format.html { render :edit }
        format.json { render json: @visa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /visas/1
  # DELETE /visas/1.json
  def destroy
    authorize! :delete, @visa
    @visa.destroy
    
    render nothing:true
    flash[:notice] = 'Xóa thông tin visa thành công.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_visa
      @visa = Visa.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def visa_params
      params.require(:visa).permit(:country_id, :title_1, :content_1, :title_2, :content_2, :title_3, :content_3, :title_4, :content_4, :title_5, :content_5, :title_6, :content_6)
    end
end
