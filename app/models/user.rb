class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
         
  before_create :auto_confirm_if_first_user

  def admin?
    admin
  end

  private

  # Hacky - but this will provide some level of protection.
  def auto_confirm_if_first_user
    if User.count == 0
      self.confirmed_at = Time.current
    end
  end
end
