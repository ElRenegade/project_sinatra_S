class CreateGloves < ActiveRecord::Migration
  def change
    create_table :gloves do |t|
      t.string :item
      t.integer :quantity
      t.integer :price
      t.integer :customer_id
    end
  end
end
