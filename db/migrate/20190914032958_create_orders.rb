class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :item
      t.integer :quantity
      t.float :price
      t.integer :customer_id
    end
  end
end
