class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.integer :product_id
      t.integer :quantity
      t.float :total

      t.timestamps null: false
    end
  end
end
