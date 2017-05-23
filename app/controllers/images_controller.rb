class ImagesController < ApplicationController
    def new
    @product = Product.find_by(id: params[:product_id])
    render "new.html.erb"
  end

  def create
    Image.create(url: params[:url], product_id: params[:product_id])
    redirect_to "/products/#{params[:product_id]}"
  end
   def destroy
     @product_image = Image.all.where(product_id: params[:product_id])
     @product_image.last.url= nil
     redirect_to "/products/#{params[:product_id]}"
     flash[:danger] = "Your product image has been deleted"
  end
end
