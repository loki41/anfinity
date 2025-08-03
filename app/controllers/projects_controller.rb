class ProjectsController < ApplicationController
  def index
    @featured_projects = Project.featured_and_published
    @projects = Project.not_featured_and_published
  end

  def show
    @project = Project.find_by!(slug: params[:slug])

    file_path = Rails.root.join("public", "projects", @project.json_filename)

    if File.exist?(file_path)
      file = File.read(file_path)
      @project_details = JSON.parse(file).with_indifferent_access
    else
      @project_details = {}
      flash.now[:alert] = "JSON file not found"
    end
  end
end
