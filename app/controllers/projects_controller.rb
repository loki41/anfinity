class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_filter :set_project, except: [:index, :new, :create]
  before_filter :login_required, :only => [:new, :create, :edit, :destroy], unless: :user_signed_in?
  
  
  add_breadcrumb "Projects", :projects_path
  # GET /projects
  # GET /projects.json
  def index
    if params[:sort] && params[:direction]
      params[:direction]  = "asc" ? @projects = Project.all.sort_by(&:duration) : @projects = Project.all.sort_by(&:duration).reverse
    else
      @projects = Project.all
    end
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
	add_breadcrumb @project.name, @project
    respond_to do |format|
      format.html
      format.json { render json: @project }
     end
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)
    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render json: @project }
      else
        format.html { render action: 'new' }
        format.json { render json: @project.errors }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:name, :category, :site_link, :customer, :description, :feature_image, :tech, :duration, 
										:features, :meta_title, :meta_description, :meta_keywords)
    end
end
