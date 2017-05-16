class ProductsController < ApplicationController
  def index
    @products = Product.all

     render "index.html.erb"
  end
   def show
    @product = Product.find_by(id: params[:id])
    render 'show.html.erb'
   end
  def create
      @product = Product.create(name: params[:name_param], price: params[:price_param], description: params[:description_param], remaining: params[:remaining_param], image: params[:image_param])
      @product.save
    # render "create.html.erb"
    redirect_to "/products/#{@product.id}"
    flash[:info] = "Your product has been creatted"
  end
  def new
    render 'new.html.erb'
  end
  def edit
    @product = Product.find_by(id: params[:id])
    render 'edit.html.erb'
    # redirect_to "/products/#{@product.id}/edit"
  end
  def update
    @product = Product.find_by(id: params[:id])
    @product.name = params[:name_param]
    @product.price = params[:price_param]
    @product.description = params[:description_param]
    @product.remaining = params[:remaining_param]
    @product.image = params[:image_param]
    @product.save
    redirect_to "/products/#{@product.id}"
    # render "update.html.erb"
     flash[:success] = "Your product has been updated"
  end
  def destroy
     @product = Product.find_by(id: params[:id])
     @product.destroy
     redirect_to "/products/"
     flash[:danger] = "Your product has been deleted"
  end
end
