class VendorsController < ApplicationController

  def index
    @vendors = Vendor.all
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
