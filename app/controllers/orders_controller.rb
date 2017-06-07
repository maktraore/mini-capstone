class OrdersController < ApplicationController
   before_action :current_user
  def create
    if current_user
      @orders = CartedProduct.where(status: "carted", user_id: current_user.id)
      subtotal = 0 
      @orders.each do |cartedprod|
        subtotal+= cartedprod.product.price*cartedprod.quantity
      end
      tax = subtotal*0.0875
      total = subtotal + tax
       @order = Order.create(user_id: current_user.id, subtotal: subtotal, tax: tax, total: total)
       @orders.each do |order|
         order.update(status: "purchased", order_id: @order.id)

       end
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
