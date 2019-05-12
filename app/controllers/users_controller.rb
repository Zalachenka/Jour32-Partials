class UsersController < ApplicationController
  before_action :your_profile?, only: [:show]
  before_action :authenticate?, only: [:show]

  def show
    @user = User.find(params[:id])
    @event = Event.where(admin_id: params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    #supprime les events et les participations associées à l'utilisateur
    @user = User.find(params[:id])
    UserDelete.new(Event.where(admin_id: @user.id), Attendance.where(participant_id: @user.id)).perform
    @user.destroy
    flash[:success] = "User deleted!"
    redirect_to admin_index_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :description)
  end

  def authenticate?
    redirect_to root_path unless user_signed_in?
  end

  def your_profile?
    redirect_to root_path if current_user.is_admin != true && current_user != User.find(params[:id])
  end
end
