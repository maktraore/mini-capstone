class CartedProductsController < ApplicationController
   def create
    if current_user
    @cart = CartedProduct.new(product_id: params[:product_id], user_id: current_user.id, quantity: params[:quantity], status: "carted")
      @cart.save
      redirect_to "/carts"
    end
    # redirect_to "/login"
   end
   def index

    @carts = current_user.carted_products.where(status: "carted")
  # end

   end
   def  destroy
    @cartedproduct = CartedProduct.find_by(id: params[:id])
    @cartedproduct.update(status: "removed")
      redirect_to "/carts"
   end
end
