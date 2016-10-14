class Admin::GalleriesController < ApplicationController
  before_action :set_gallery, only: [:show, :edit, :update, :destroy]

  # GET /galleries
  # GET /galleries.json
  def index
    authorize! :read, Gallery
    @galleries = Gallery.order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
  end

  # GET /galleries/1
  # GET /galleries/1.json
  def show
  end

  # GET /galleries/new
  def new
    authorize! :create, Gallery
    @gallery = Gallery.new
    10.times do
      @gallery.gallery_images.build
    end
  end

  # GET /galleries/1/edit
  def edit
    authorize! :update, @gallery
    (10-@gallery.gallery_images.count).times do
      @gallery.gallery_images.build
    end
  end

  # POST /galleries
  # POST /galleries.json
  def create
    authorize! :create, Gallery
    @gallery = Gallery.new(gallery_params)

    respond_to do |format|
      if @gallery.save
        format.html { redirect_to edit_admin_gallery_path(@gallery.id), notice: 'Tạo mới hình ảnh hoạt động thành công.' }
        format.json { render :show, status: :created, location: @gallery }
      else
        format.html { render :new }
        format.json { render json: @gallery.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /galleries/1
  # PATCH/PUT /galleries/1.json
  def update
    authorize! :update, @gallery
    respond_to do |format|
      if @gallery.update(gallery_params)
        format.html { redirect_to edit_admin_gallery_path(@gallery.id), notice: 'Cập nhật hình ảnh hoạt động thành công.' }
        format.json { render :show, status: :ok, location: @gallery }
      else
        format.html { render :edit }
        format.json { render json: @gallery.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /galleries/1
  # DELETE /galleries/1.json
  def destroy
    authorize! :delete, @gallery
    @gallery.destroy
    
    render nothing:true
    flash[:notice] = 'Xóa hình ảnh hoạt động thành công.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gallery
      @gallery = Gallery.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gallery_params
      params.require(:gallery).permit(:image_url, :title, :description, gallery_images_attributes: [:id, :image_url, :_destroy])
    end
end
