class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:username, :password, :email, :password_confirmation))
    if @user.save
      redirect_to spots_path
    else
      redirect_to spots_path
    end
  end

  def show
    @your_reservations = current_user.rented_reservations
    @your_spots = current_user.spots
  end
end