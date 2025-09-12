# app/controllers/admin/project_types_controller.rb
class Admin::ProjectTypesController < ApplicationController
  before_action :require_admin
  before_action :set_project_type, only: [:edit, :update, :destroy]

  def index
    @project_types = ProjectType.all
  end

  def new
    @project_type = ProjectType.new
  end

  def create
    @project_type = ProjectType.new(project_type_params)
    if @project_type.save
      redirect_to admin_project_types_path, notice: "Project type created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @project_type.update(project_type_params)
      redirect_to admin_project_types_path, notice: "Project type updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @project_type.destroy
    redirect_to admin_project_types_path, notice: "Project type deleted"
  end

  private

  def set_project_type
    @project_type = ProjectType.find(params[:id])
  end

  def project_type_params
    params.require(:project_type).permit(:name)
  end

  def require_admin
    redirect_to root_path, alert: "Not authorized" unless current_user&.admin?
  end
end
