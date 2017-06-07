class Product < ApplicationRecord
    belongs_to :supplier
    has_many :images
    has_many :users
    has_many :categorized_products
    has_many :categories, through: :categorized_products
    has_many :carted_products
    has_many :orders, through: :carted_products

    validates :name, :description, :price, :description, :remaining,presence: true
    validates :price, :remaining, numericality: true
    validates :name, :description, length: { maximum: 30}
    validates :price, :remaining, length: { maximum: 6}
     validates :name, uniqueness:true
    def sale_message
      if price < 2
        "Discount Item!" 
      else
        "Everyday Value!"
     end
   end
   def  make_favorite
    product = Product.find_by(id: id)
    # Product.find_by(id:product.id).images.each do |image|
    prod= product.images.all
   if !prod.empty?
    if prod.where(favorite: true).first.url == nil
      prod.update(favorite: true).first.url = "something" 
    else
      prod.where(favorite: false).first.update(favorite: true)
   end
 end
 end
     def tax
       price*0.09
     end
     def total
      price*1.09
     end
end
