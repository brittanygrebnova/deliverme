class ItemsController < ApplicationController

  def new
    @item = Item.new(vendor_id: params[:vendor_id])
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
