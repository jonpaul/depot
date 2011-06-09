class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :cart
  
  def total_price
    product.price * quantity
  end

  def remove_item
    if self.quantity > 1
      self.update_attribute(:quantity, self.quantity-=1)
    else
      self.destroy
    end
  end
end
