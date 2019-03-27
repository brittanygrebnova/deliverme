class OrdersController < ApplicationController

  def index
    @orders = current_user.orders
    if @orders.empty?
      flash[:notice] = "You haven't placed any orders yet."
    end
  end

  def new
    @order = Order.new(vendor_id: params[:vendor_id])
    @vendor = Vendor.find(params[:vendor_id])
    @items = @vendor.items
  end

  def create
    @vendor = Vendor.find(params[:order][:vendor_id])
    @items = Item.find(params[:order][:item_ids].reject(&:blank?))
    @order = current_user.orders.build(order_params)
    if @order.total <= current_user.balance
      @order.place_order
      binding.pry
      @order.save
      flash[:notice] = "Thank you for your order! It'll be delivered in 30 minutes :)"
      redirect_to order_path(@order)
    else
      flash[:notice] = "Sorry, you don't have enough money to place this order."
      redirect_to user_path(current_user)
    end
  end

  def show
    @order = Order.find(params[:id])
    if DateTime.now > @order.created_at + 30.minutes
      @order.delivered = true
    end
    render json: @order
  end

  def edit
    @order = Order.find(params[:id])
    @vendor = @order.vendor
    @items = @vendor.items
  end

  def update
    @order = Order.find(params[:id])
    @order.assign_attributes(order_params)
    if @order.total <= current_user.balance
      @order.save
      @order.place_order
      flash[:notice] = "Thank you for your order! It'll be delivered in 30 minutes :)"
      redirect_to order_path(@order)
    else
      flash[:notice] = "Sorry, you don't have enough money to place this order."
      redirect_to user_path(current_user)
    end
  end

  def destroy
  end

  private

  def order_params
    params.require(:order).permit(:user_id, :vendor_id, item_ids: [])
  end


end
