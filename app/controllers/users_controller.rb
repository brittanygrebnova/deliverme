class UsersController < ApplicationController

  def show
    @user = current_user
  end

  def add_money
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:street_address, :city, :balance)
  end

end
