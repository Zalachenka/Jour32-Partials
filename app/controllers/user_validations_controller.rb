class UserValidationsController < ApplicationController
  def edit
    @user = User.find(params[:id]).update(validated: true)
    flash[:success] = "User validated"
    redirect_to admin_index_path
  end

  def update
    @user = User.find(params[:id])
    if @user.update(validated: true)
      flash[:success] = "User validated"
      redirect_to admin_index_path
    else
      render :edit
    end
  end
end
