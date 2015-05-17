class PagesController < ApplicationController
  def about
	add_breadcrumb "About", about_path
	@tab = "about"
  end

  def contact
  	@tab = "contact"
  end
end