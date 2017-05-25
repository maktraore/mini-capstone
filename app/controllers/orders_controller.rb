class OrdersController < ApplicationController
  def create
    # product = Product.find_by(id: params[:product_id])
    # order_subtotal = params[:quantity].to_i * product.price
    # order_tax = order_subtotal * 0.09
    # order_total = order_subtotal+order_tax
    @order = Order.new(quantity: params[:quantity], user_id: current_user.id, product_id: params[:product_id]
     # subtotal: order_subtotal, tax: order_tax, total: order_total
     )
    # new price calculations
    subtotal = @order.product.price*@order.quantity
    # tax = @order.product.tax * @order.quantity
    tax = subtotal * 0.09
    total =subtotal + tax
    @order.subtotal = subtotal
    @order.tax = tax
    @order.total = total
    @order.save
     redirect_to "/orders/#{@order.id}"
  end
  def show
    @order = Order.find_by(id: params[:id])
    render 'show.html.erb'
  end
end
