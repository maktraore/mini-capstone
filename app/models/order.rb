class Order < ApplicationRecord
  belongs_to :product, optional: true
  belongs_to :user
  has_many :carted_products

  has_many :products, through: :carted_products
#  def subtotal(carted_products)
#       new_subtoal = 0
#        carted_products.each do |cartedprod|
#           new_subtotal +=  cartedprod.product.price*cartedprod.quantity
#         end
#         self.subtotal = new_subtotal
#  end

 
# def tax
#   self.tax = subtotal * 0.09
#  end
#  def total
#   self.total = subtotal + tax
#  end
#  def absolute_total(carted_products)
#      subtotal(carted_products)
#     tax
#     total
# end
end
