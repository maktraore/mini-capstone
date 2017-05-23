class Product < ApplicationRecord
    belongs_to :supplier
    has_many :images
    def sale_message
      if price < 2
        "Discount Item!" 
      else
        "Everyday Value!"
     end
   end
     def tax
       price*0.09
     end
     def total
      price*1.09
     end
end
