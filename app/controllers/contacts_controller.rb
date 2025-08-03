class ContactsController < ApplicationController
  def create
    name = params[:name]
    email = params[:email]
    subject = params[:subject]
    message = params[:message]

    ContactMailer.contact_email(name, email, subject, message).deliver_now
    flash[:success] = "Thanks for getting in touch! I’ll get back to you soon."
    redirect_to contact_path, notice: "Your message has been sent!"
  end
end
