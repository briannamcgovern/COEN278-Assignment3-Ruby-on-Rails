class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :size
      t.text :description
      t.decimal :price
    end
  end
end
