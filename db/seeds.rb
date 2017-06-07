# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# 10.times do 
#   Product.create(name: Faker::Commerce.product_name, price: Faker::Commerce.price, description: Faker::Lorem.word, remaining:Faker::Number.number(1), image: Faker::Placeholdit.image)
# end

# Product.all.each do |product|
#   5.times do 
#     Image.create(url: Faker::Placeholdit.image, 
#       product_id: product.id)
#   end
# end
Category.create(name: "NetworkDevices")
Category.create(name: "Phones")
Category.create(name: "Computers")

Product.all.each do |prod|
  CategorizedProduct.create(product_id: prod.id, category_id: Category.pluck(:id).sample)
  CategorizedProduct.create(product_id: prod.id, category_id: Category.pluck(:id).sample)
end

