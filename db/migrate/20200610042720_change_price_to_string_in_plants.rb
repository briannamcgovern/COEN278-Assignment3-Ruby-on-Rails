class ChangePriceToStringInPlants < ActiveRecord::Migration[6.0]
  def change
    change_column :plants, :price, :string
  end
end
