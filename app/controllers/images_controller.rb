class ImagesController < ApplicationController
  before_action :authenticate_admin!
    def index
      @images = Product.find_by(id: params[:product_id]).images
      @product = Product.find_by(id: params[:product_id])
      @images.all
    end

    def edit
      @product = Product.find_by(id: params[:product_id])
      render 'edit.html.erb'
    end

    def update
      @product = Product.find_by(id: params[:id])
      @image = Image.find_by(product_id: @product.id)
      if params[:favorite] == "Yes"
        @product.images.update_all(favorite: false)
        @image.update(favorite: true) 
      end

      # redirect_to "/products/#{@product.id}"
      redirect_to "/products"
    end

    def new
    @product = Product.find_by(id: params[:product_id])
    render "new.html.erb"
  end

  def create
    Image.create(url: params[:url], product_id: params[:product_id], favorite: true)
    redirect_to "/products"
  end
   def destroy
     @product_images = Product.find_by(id: params[:product_id]).images
     @product_images.first.destroy
     redirect_to "/products"
     flash[:danger] = "Your product image has been deleted"
  end
end
