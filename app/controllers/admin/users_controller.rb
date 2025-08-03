# app/controllers/admin/users_controller.rb
class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin

  def index
    @unconfirmed_users = User.where(confirmed_at: nil)
  end

  def confirm
    user = User.find(params[:id])
    user.update(confirmed_at: Time.current)
    redirect_to admin_users_path, notice: "#{user.email} has been confirmed."
  end

  private

  def require_admin
    redirect_to root_path, alert: "Not authorized" unless current_user.admin?
  end
end
