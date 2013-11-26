class CreateSequential < ActiveRecord::Migration
  def change
    create_table(:sequential) do |t|
      t.string  :model
      t.string  :column
      t.string  :scope
      t.string  :scope_value
      t.integer :value
      t.timestamps
    end

    add_index :sequential, [:model, :column, :scope, :scope_value], unique: true
  end
end
