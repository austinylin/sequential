class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :price
      t.integer :sequential_id
      t.integer :category_id
      t.timestamps
    end
  end
end
