class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title, :null => false
      t.string :description, :null => false
      t.integer :cost, :null => false
      t.integer :quantity
      t.timestamps
    end
  end
end
