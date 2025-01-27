class RegistrationsController < ApplicationController
  skip_before_action :require_authentication, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: "User was successfully created."
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email_address, :password)
  end
end
