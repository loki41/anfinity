class InquiriesController < ApplicationController
  
  def new
    @inquiry = Inquiry.new
	add_breadcrumb "Contact", new_inquiry_path
  end
    
  def create
    @inquiry = Inquiry.new(params[:inquiry])
    if @inquiry.deliver
      render :thank_you
    else
      render :new
    end
  end
  
end