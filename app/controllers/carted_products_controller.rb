class CartedProductsController < ApplicationController
  before_action :authenticate_user
   def create

    @cart = CartedProduct.new(product_id: params[:product_id], user_id: current_user.id, quantity: params[:quantity], status: "carted")
    @previous = CartedProduct.find_by(product_id: params[:product_id], status: "carted", user_id: current_user.id)
    # binding.pry
     if @previous 
        @previous.update(quantity: (params[:quantity].to_i + @previous.quantity))
        flash[:success] = "Item added to cart"
      redirect_to "/carts"
      elsif @cart.save
        @cart.update(quantity: params[:quantity])
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
  def edit
    @cart = CartedProduct.find_by(id: params[:id])

  end
  def show
    @cart = CartedProduct.find_by(id: params[:id])
  end
  def  update
      @cart = CartedProduct.find_by(id: params[:id])
      @cart.quantity = params[:quantity]
      @cart.save
      redirect_to '/carts'
  end 
   end
   def  destroy
    @cartedproduct = CartedProduct.find_by(id: params[:id])
    @cartedproduct.update(status: "removed")
      redirect_to "/carts"
   end
end
