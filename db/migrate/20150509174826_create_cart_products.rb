class CreateCartProducts < ActiveRecord::Migration
  def change
    create_table :cart_products do |t|
      t.belongs_to :user
      t.integer :product_id
      t.integer :product_quantity
      t.belongs_to :product
      t.timestamps
    end

  end
end
