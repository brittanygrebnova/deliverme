class OrdersController < ApplicationController

  def index
    @orders = current_user.orders
    if @orders.empty?
      flash[:notice] = "You haven't placed any orders yet."
    end
    respond_to do |f|
      f.html { render :index }
      f.json { render json: @orders}
    end
  end

  def new
    @order = Order.new(vendor_id: params[:vendor_id])
    @vendor = Vendor.find(params[:vendor_id])
    @items = @vendor.items
  end

  def create
    @order = current_user.orders.build(order_params)
    @vendor = Vendor.find(params[:order][:vendor_id])
    @items = Item.find(params[:order][:item_ids])
    # if @order.total <= current_user.balance
    #   @order.place_order
    #   @order.save
    #   flash[:notice] = "Thank you for your order! It'll be delivered in 30 minutes :)"
    if @order.save
      render json: @order
      # redirect_to order_path(@order)
    # else
    #   flash[:notice] = "Sorry, you don't have enough money to place this order."
    #   redirect_to user_path(current_user)
    end
  end

  def show
    @order = Order.find(params[:id])
    if DateTime.now > @order.created_at + 30.minutes
      @order.delivered = true
    end
    respond_to do |f|
      f.html { render :show }
      f.json { render json: @order }
    end
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
    params.require(:order).permit(:vendor_id, :item_ids, item_ids: [])
  end


end
