class User < ApplicationRecord
  has_many :orders
 has_many :carted_products

  has_secure_password
  
  validates :name, presence: true
     validates :email, uniqueness:true
end
