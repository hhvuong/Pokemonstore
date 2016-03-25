class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :customer_id
      t.integer :product_id

      t.timestamps null: false
    end
  end
end
