class ProductsController < ApplicationController
  def index
    if current_user
      if params[:sort] && params[:sort_order]
        @products = Product.order(params[:sort] => params[:sort_order])
      elsif params[:discount]
        @products = Product.where("price < ?", 10)
      elsif params[:search]
        @products = Product.where("name ILIKE ?", "%#{params[:search]}%")
      else
      @products = Product.all
      end
     render "index.html.erb"
    else
      redirect_to "/login"
    end
  end
   def show
    if params[:id] == "random"
      @product = Product.all.sample
    else
    @product = Product.find_by(id: params[:id])
     end
    render 'show.html.erb'
   end
  def create
      @product = Product.create(name: params[:name_param], price: params[:price_param], description: params[:description_param], remaining: params[:remaining_param])
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
    @image = Product.find_by(product_id: params[:product_id])
    @product.name = params[:name_param]
    @product.price = params[:price_param]
    @product.description = params[:description_param]
    @product.remaining = params[:remaining_param]
    @product.supplier_id = params[:supplier_id]
    @image.url = params[:url]
    # Image.create(url: params[:url], product_id: params[:product_id])
    @product.save
    # redirect_to "/products/#{params[:product_id]}"
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
