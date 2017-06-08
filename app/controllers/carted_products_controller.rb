class CartedProductsController < ApplicationController
  before_action :authenticate_user
   def create
    @cart = CartedProduct.new(product_id: params[:product_id], user_id: current_user.id, quantity: params[:quantity], status: "carted")
      if @cart.save
        flash[:success] = "Item added to cart"
      redirect_to "/carts"
    else 
      flash[:warning] = "Item not added to cart. #{@cart.errors.full_messages.join(", ")}"
      redirect_to  "/products/#{params[:product_id]}"
    end
    # redirect_to "/login"
   end
   def index
    if current_user
    @carts = current_user.carted_products.where(status: "carted")
  end
  # end

   end
   def  destroy
    @cartedproduct = CartedProduct.find_by(id: params[:id])
    @cartedproduct.update(status: "removed")
      redirect_to "/carts"
   end
end
