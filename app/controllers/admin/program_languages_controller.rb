class Admin::ProgramLanguagesController < ApplicationController
  before_action :set_program_language, only: [:show, :edit, :update, :destroy]

  # GET /program_languages
  # GET /program_languages.json
  def index
    @program_languages = ProgramLanguage.all.paginate(:page => params[:page], :per_page => 10)
  end

  # GET /program_languages/1
  # GET /program_languages/1.json
  def show
  end

  # GET /program_languages/new
  def new
    @program_language = ProgramLanguage.new
  end

  # GET /program_languages/1/edit
  def edit
  end

  # POST /program_languages
  # POST /program_languages.json
  def create
    @program_language = ProgramLanguage.new(program_language_params)

    respond_to do |format|
      if @program_language.save
        format.html { redirect_to edit_admin_program_language_path(@program_language.id), notice: 'Program language was successfully created.' }
        format.json { render :show, status: :created, location: @program_language }
      else
        format.html { render :new }
        format.json { render json: @program_language.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /program_languages/1
  # PATCH/PUT /program_languages/1.json
  def update
    respond_to do |format|
      if @program_language.update(program_language_params)
        format.html { redirect_to edit_admin_program_language_path(@program_language.id), notice: 'Program language was successfully updated.' }
        format.json { render :show, status: :ok, location: @program_language }
      else
        format.html { render :edit }
        format.json { render json: @program_language.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /program_languages/1
  # DELETE /program_languages/1.json
  def destroy
    @program_language.destroy
    
    render nothing:true
    flash[:notice] = 'Program language was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_program_language
      @program_language = ProgramLanguage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def program_language_params
      params.require(:program_language).permit(:name, :description)
    end
end
