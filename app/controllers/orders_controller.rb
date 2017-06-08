class OrdersController < ApplicationController
   # before_action :current_user
   def create
      if current_user
        @orders = CartedProduct.where(status: "carted", user_id: current_user.id)
        subtotal =0 
        @orders.each do |cartedprod|
          subtotal+= cartedprod.product.price*cartedprod.quantity
          previous_remaining_prod =  cartedprod.product.remaining 
          remaining_prod =  cartedprod.product.remaining 
          remaining_prod-= cartedprod.quantity
          if remaining_prod > 0
            cartedprod.product.update(remaining:  remaining_prod)
             tax = subtotal*0.0875
             total = subtotal + tax
             @order = Order.create(user_id: current_user.id, subtotal: subtotal, tax: tax, total: total)
              cartedprod.update(status: "purchased", order_id: @order.id)

            redirect_to "/orders/#{@order.id}" and return
            
          elsif remaining_prod == 0 
            cartedprod.product.update(remaining:  remaining_prod, in_stock: false)
             tax = subtotal*0.0875
             total = subtotal + tax
             @order = Order.create(user_id: current_user.id, subtotal: subtotal, tax: tax, total: total)
            cartedprod.update(status: "purchased", order_id: @order.id)

            redirect_to "/orders/#{@order.id}" and return

          else
            flash[:danger]= " Sorry we only have #{previous_remaining_prod} of #{cartedprod.product.name}  for now" 
            redirect_to "/carts" and return
          end
     end
     else
      flash[:danger] = "Please login or sign up if you don't have an account"
      redirect_to "/products/#{params[:product_id]}" 
      end
    end
  def show
    @orders = Order.where(user_id: current_user.id)
    @order =  @orders.last
    render 'show.html.erb'
  end
end
