class OrdersController < ApplicationController
  def create
    product = Product.find_by(id: params[:product_id])
    # order_subtotal = params[:quantity].to_i * product.price
    # order_tax = order_subtotal * 0.09
    # order_total = order_subtotal+order_tax
    if current_user
      @order = Order.new(quantity: params[:quantity], user_id: current_user.id, product_id: params[:product_id])
     # subtotal: order_subtotal, tax: order_tax, total: order_total
    # new price calculations
    # tax = @order.product.tax * @order.quantity
      @order.subtotal = @order.product.price*@order.quantity
      @order.tax = @order.subtotal * 0.09
      @order.total =@order.subtotal + @order.tax 
      @order.save
      redirect_to "/orders/#{@order.id}"
    else
      flash[:danger] = "Please login or sign up if you don't have an account"
      redirect_to "/products/#{params[:product_id]}"
    end
  end
  def show
    @order = Order.find_by(id: params[:id])
    render 'show.html.erb'
  end
end
