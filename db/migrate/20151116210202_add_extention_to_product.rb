class AddExtentionToProduct < ActiveRecord::Migration
  def change
    add_column :products, :extension, :string
  end
end
