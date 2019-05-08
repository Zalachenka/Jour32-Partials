class UsersController < ApplicationController
  before_action :your_profile?, only: [:show]
  before_action :authenticate?, only: [:show]

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
      redirect_to @user
    else
      render :edit
    end
  end 

  private

  def authenticate?
    redirect_to root_path unless user_signed_in?
  end

  def your_profile?
    redirect_to root_path if current_user != User.find(params[:id])
  end
end
