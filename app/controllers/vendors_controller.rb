class VendorsController < ApplicationController

  before_action :authenticate_vendor!, :except => [:index]

  def index
    @vendors = Vendor.all
  end

  def show
    @vendor = Vendor.find(params[:id])
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
