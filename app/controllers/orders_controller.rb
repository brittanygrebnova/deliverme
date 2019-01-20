class OrdersController < ApplicationController

  def index
    @orders = current_user.orders
  end

  def new
    @order = Order.new(user_id: params[:user_id])
    @vendors = Vendor.all
    @items = Item.all
  end

  def create
    @vendor = Vendor.find(params[:order][:vendor_id])
    @items = Item.find(params[:order][:item_ids].reject(&:blank?))
    @valid_items = @items.select {|item| item.vendor_id == @vendor.id}

    if @items == @valid_items
      @order = Order.create(user_id: params[:order][:user_id], vendor_id: params[:order][:vendor_id])
      @order.items << @valid_items
      @order.place_order
      redirect_to user_order_path(current_user, @order)
    else
      flash[:notice] = "Invalid Vendor/Item Combo"
      redirect_to new_user_order_path(current_user)
    end

  end

  def show
    @order = Order.find(params[:id])
    @items = @order.items
    if DateTime.now > @order.created_at + 30.minutes
      @order.delivered = true
    end
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.update(order_params)
  end

  def destroy
  end

  private

  def order_params
    params.require(:order).permit(:user_id, :vendor_id, item_ids: [])
  end

end
