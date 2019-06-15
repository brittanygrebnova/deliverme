class UsersController < ApplicationController
  # before_action :authenticate_user!, :only => [:new, :edit]

  def show
    @user = current_user
    respond_to do |f|
      f.html { render :show }
      f.json { render json: @user }
    end
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

  def update_balance
    amount = params[:user][:balance].to_i
    current_user.balance += amount
    current_user.save
    flash[:notice] = "Hooray! #{amount} dollars has been added to your account balance."
    redirect_to user_path(current_user)
  end

  def add_profile
    @user = current_user
  end

  def update_profile
    current_user.user_name = params[:user][:user_name]
    current_user.street_address = params[:user][:street_address]
    current_user.city = params[:user][:city]
    current_user.state = params[:user][:state]
    current_user.save
    redirect_to user_path(current_user)
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :street_address, :city, :state, :balance)
  end

end
