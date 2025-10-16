class Admin::ProjectsController < ApplicationController
  before_action :set_project, only: [:edit, :update, :destroy]

  helper_method :available_json_files
  helper_method :available_cover_images

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end
  
  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to admin_projects_path, notice: 'Project created!'
    else
      Rails.logger.error @project.errors.full_messages.inspect
      render :new, status: :unprocessable_entity
    end
  end

  def edit; 
  end

  def update
    if @project.update(project_params)
      redirect_to admin_projects_path, notice: 'Project updated!'
    else
      render :edit
    end
  end

  def destroy
    @project.destroy
    redirect_to admin_projects_path, notice: 'Project deleted!'
  end

  private

  def set_project
    @project = Project.find_by!(slug: params[:slug])
  end

  def project_params
    params.require(:project).permit(:title, :slug, :description, :hero_image, :json_filename, :featured, :published, :figma_file, :figma_prototype, :project_type_id, :new)
  end

  def require_admin
    # Simple hardcoded protection for now:
    authenticate_or_request_with_http_basic do |username, password|
      ActiveSupport::SecurityUtils.secure_compare(username, ENV["ADMIN_USER"]) &
      ActiveSupport::SecurityUtils.secure_compare(password, ENV["ADMIN_PASS"])
    end
  end

  def available_json_files
    Dir.glob(Rails.root.join("public", "projects", "*.json")).map do |path|
      File.basename(path)
    end
  end

  def available_cover_images
    Dir.glob(Rails.root.join('public', '**', '*_cover.{png,jpg,jpeg,gif,webp}'), File::FNM_CASEFOLD)
     .map do |path|
       # Convert absolute file system path to a public URL
       path.sub(Rails.root.join('public').to_s, '')
    end
  end
end
