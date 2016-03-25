class Customer < ActiveRecord::Base
	has_many :shopping_carts
	has_many :likes
	
def get_products
    products = self.likes.collect do |e|
      e.product
    end
    return products
  end 
  
  # Check if student is enrolled in a course
  def liked_in?(product)
    return get_products.include?(product) 
  end
  
  # Get list of all courses that a 
  # student is not enrolled
  def unliked_products
      return Product.all - get_products
end


end
