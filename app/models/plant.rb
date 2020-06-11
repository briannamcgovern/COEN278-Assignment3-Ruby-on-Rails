class Plant < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :cart
  belongs_to :plant
  has_many :carts, through: :cart_items
  has_many :cart_items

end
