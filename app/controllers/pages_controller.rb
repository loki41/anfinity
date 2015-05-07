class PagesController < ApplicationController
  def index
  	@projects = Project.all
  end

  def about
	add_breadcrumb "About", about_path
  end

  def contact
  end
end