class Order < ActiveRecord::Base
	belongs_to :shopping_cart
	belongs_to :customer
end
