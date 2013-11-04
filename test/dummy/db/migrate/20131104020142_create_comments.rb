class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :title
      t.integer :absolute_number
      t.integer :sequential_id
      t.integer :post_id

      t.timestamps
    end
  end
end
