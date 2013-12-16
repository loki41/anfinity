class PagesController < ApplicationController
  def about
	add_breadcrumb "About", about_path
  end

  def contact
  end
end