class Admin::ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all.paginate(:page => params[:page], :per_page => 10)
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
  end

  # GET /projects/new
  def new
    @project = Project.new
    @start_date = Time.now.strftime("%d/%m/%Y")
    @end_date = Time.now.strftime("%d/%m/%Y")
    @project_categories = ProjectCategory.get_all_categories
    @program_languages = ProgramLanguage.all
    
    10.times do
      @project.project_images.build
    end
  end

  # GET /projects/1/edit
  def edit
    @start_date = @project.start_date.strftime("%d/%m/%Y")
    @end_date = @project.end_date.strftime("%d/%m/%Y")
    @project_categories = ProjectCategory.get_all_categories
    @program_languages = ProgramLanguage.all
    
    (10-@project.project_images.count).times do
      @project.project_images.build
    end
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)
    
    if params[:project_category_ids].present?
      params[:project_category_ids].each do |id|      
        @project.project_categories << ProjectCategory.find(id)
      end
    end
    
    if params[:program_language_ids].present?
      params[:program_language_ids].each do |id|      
        @project.program_languages << ProgramLanguage.find(id)
      end
    end
    
    respond_to do |format|
      if @project.save
        format.html { redirect_to edit_admin_project_path(@project.id), notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    @project.project_categories.clear
    @project.program_languages.clear
    
    if params[:project_category_ids].present?
      params[:project_category_ids].each do |id|      
        @project.project_categories << ProjectCategory.find(id)
      end
    end
    
    if params[:program_language_ids].present?
      params[:program_language_ids].each do |id|      
        @project.program_languages << ProgramLanguage.find(id)
      end
    end
    
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to edit_admin_project_path(@project.id), notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    
    render nothing:true
    flash[:notice] = 'Project was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:image_url, :author, :author_vi, :name, :name_vi, :start_date, :end_date, :description, :description_vi, :website, project_images_attributes: [:id, :image_url, :_destroy])
    end
end
