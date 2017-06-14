class ProductsController < ApplicationController
  #older version use filter_action
  before_action :authenticate_admin!,  except: [:index, :show]
  def index
      if params[:sort] && params[:sort_order]
        @products = Product.order(params[:sort] => params[:sort_order])
      elsif params[:discount]
        @products = Product.where("price < ?", 10)
      elsif params[:search]
        @products = Product.where("name ILIKE ?", "%#{params[:search]}%")
      elsif params[:category]
         category = Category.find_by(name:params[:category])
         @products = category.products
      else
      @products = Product.all
      end
     render "index.html.erb"
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
      @product = Product.new(name: params[:name_param], price: params[:price_param], description: params[:description_param], remaining: params[:remaining_param], supplier_id: params[:supplier_id])
      if @product.save
        # @image = Image.find_by(product_id: params[:id])
        @image = Image.create(product_id: @product.id, url: params[:url], favorite:true)
        # @image.url = params[:url]
        # @image.save
    
    # render "create.html.erb"
    redirect_to "/products"
    flash[:info] = "Your product has been creatted"
      else
      @suppliers = Supplier.all
       render 'new.html.erb'
      end
  end
  def new
    @product = Product.new
    @suppliers = Supplier.all
    render 'new.html.erb'
  end
  def edit
    @suppliers = Supplier.all
    @product = Product.find_by(id: params[:id])
    @image = Image.find_by(product_id: params[:id])
    render 'edit.html.erb'
    # redirect_to "/products/#{@product.id}/edit"
  end
  def update
    @product = Product.find_by(id: params[:id])
    @image = Image.find_by(product_id: params[:id])
    @product.name = params[:name_param]
    @product.price = params[:price_param]
    @product.description = params[:description_param]
    @product.remaining = params[:remaining_param]
    @product.supplier_id = 1
    @image.update(url: params[:url], favorite: true)
    # Image.create(url: params[:url], product_id: params[:product_id])
    @product.save
    @image.save
    # redirect_to "/products/#{params[:product_id]}"
    redirect_to "/products/"
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
