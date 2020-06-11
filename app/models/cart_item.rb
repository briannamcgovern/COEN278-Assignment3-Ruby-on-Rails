class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :plant

  def total_price
    plant.price.to_i * quantity.to_i
  end
end
