class AdminController < ApplicationController
  before_action :check_if_admin

  def index
    @admin = User.find(current_user.id)
    @user = User.all.order("created_at ASC")
  end

  private

  def check_if_admin
    unless current_user.is_admin == true
      flash[:danger] = "You are not the admin, sorry bruh"
      redirect_to root_path
    end
  end
end
