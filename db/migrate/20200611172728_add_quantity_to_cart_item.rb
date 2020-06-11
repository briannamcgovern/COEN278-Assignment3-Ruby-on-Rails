class AddQuantityToCartItem < ActiveRecord::Migration[6.0]
  def change
    add_column :cart_items, :quantity, :integer, default: 1
    add_column :cart_items, :default, :string
  end
end
