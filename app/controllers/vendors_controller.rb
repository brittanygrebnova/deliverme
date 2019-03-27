class VendorsController < ApplicationController

  def index
    @vendors = Vendor.all
    @user = User.find(params[:user_id])
  end

  def show
    if current_vendor
      @vendor = current_vendor
      render json: @vendor
    end
  end

  def add_profile
    @vendor = current_vendor
  end

  def update_profile
    current_vendor.name = params[:vendor][:name]
    current_vendor.city = params[:vendor][:city]
    current_vendor.state = params[:vendor][:state]
    current_vendor.save
    redirect_to vendor_path(current_vendor)
  end






  # def new
  #   @vendor = Vendor.new
  # end
  #
  # def create
  #   @vendor = Vendor.create(vendor_params)
  #   session[:vendor_id] = @vendor.id
  #   redirect_to vendor_path(@vendor)
  # end

  # def show
  #   @vendor = current_vendor
  # end

  private

  def vendor_params
    params.require(:vendor).permit(:name, :city, :state)
  end

end
