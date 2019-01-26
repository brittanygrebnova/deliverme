class OrdersController < ApplicationController
  # before_action :authenticate_user!

  def index
    @orders = current_user.orders
  end

  def new
    @order = Order.new(user_id: params[:user_id])
    @vendors = Vendor.all
    @items = Item.all
  end

  def create
    @user = User.find(params[:order][:user_id])
    @vendor = Vendor.find(params[:order][:vendor_id])
    @items = Item.find(params[:order][:item_ids].reject(&:blank?))
    @valid_items = @items.select {|item| item.vendor_id == @vendor.id}
    @invalid_items = @items.select {|item| item.vendor_id != @vendor.id}
    if @items == @valid_items
      @order = Order.new(user_id: params[:order][:user_id], vendor_id: params[:order][:vendor_id])
      @order.items << @valid_items
      if @order.total <= @user.balance
        @order.save
        @order.place_order
        flash[:notice] = "Thank you for your order! It'll be delivered in 30 minutes :)"
        redirect_to user_order_path(current_user, @order)
      else
        flash[:notice] = "Sorry, you don't have enough money to place this order."
        redirect_to user_path(current_user)
      end
    else
      flash[:warning] = ["Sorry, but #{@vendor.name} doesn't sell these items: "]
      @invalid_items.collect {|invalid_item| flash[:warning] << "#{invalid_item.name}/"}
      redirect_to new_user_order_path(current_user)
    end

  end

  def show
    @order = Order.find(params[:id])
    @items = @order.items
    @user = @order.user
    @vendor = @order.vendor
    if DateTime.now > @order.created_at + 30.minutes
      @order.delivered = true
    end
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @vendor = Vendor.find(params[:order][:vendor_id])
    @items = Item.find(params[:order][:item_ids].reject(&:blank?))
    @valid_items = @items.select {|item| item.vendor_id == @vendor.id}
    @invalid_items = @items.select {|item| item.vendor_id != @vendor.id}
    if @items == @valid_items
      @order.update(user_id: params[:order][:user_id], vendor_id: params[:order][:vendor_id])
      @order.items = @valid_items
      redirect_to order_path(@order)
    else
      flash[:warning] = ["Sorry, but #{@vendor.name} doesn't sell these items: "]
      @invalid_items.collect {|invalid_item| flash[:warning] << "#{invalid_item.name}/"}
      redirect_to edit_user_order_path(current_user, @order)
    end
  end

  def destroy
  end

  private

  def order_params
    params.require(:order).permit(:user_id, :vendor_id, item_ids: [])
  end

end
