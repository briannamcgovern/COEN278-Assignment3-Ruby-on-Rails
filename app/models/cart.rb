class Cart < ApplicationRecord
  has_many :cart_items
  has_many :plants, through: :cart_items
  accepts_nested_attributes_for :cart_items

  def add(plant_id)
    items = cart_items.find_all_by_plant_id(plant_id)
    plant = Plant.find(plant_id)
    if items.size < 1
      ci = cart_items.create(:plant_id => plant_id, :quantity => 1, :price => plant.price)
    else
      ci = items.first
      ci.update_attribute(:amount, ci.amount + 1)
    end
    ci
  end

  def add_plant(plant)
    current_item = cart_items.find_by(plant_id: plant.id)

   if current_item
     current_item.increment(:quantity)
   else
     current_item = cart_items.build(plant_id: plant.id)
   end
   current_item
  end

  def total_price
    cart_items.to_a.sum { |item| item.total_price }
  end

end
