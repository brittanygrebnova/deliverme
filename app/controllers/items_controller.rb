class ItemsController < ApplicationController

  def new
    @item = Item.new(vendor_id: params[:vendor_id])
  end

  def create
    @item = Item.create(name: params[:item_name], price: params[:item_price])
    current_vendor.items << @item
    redirect_to vendor_path(current_vendor)
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
