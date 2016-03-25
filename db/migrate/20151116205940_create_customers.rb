class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :address
      t.string :email
      t.string :phone_num
      t.string :cc_type
      t.text :cc_num
      t.date :cc_exp

      t.timestamps null: false
    end
  end
end
