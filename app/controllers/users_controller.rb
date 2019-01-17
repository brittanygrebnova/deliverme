class UsersController < ApplicationController

  def show
    @user = current_user
  end

  def add_money
    @user = User.find(params[:id])
  end

end
