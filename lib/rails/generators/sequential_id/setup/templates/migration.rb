class CreateSeqIdSequences < ActiveRecord::Migration
  def change
    create_table(:seq_id_sequences) do |t|
      t.string  :model
      t.string  :scope
      t.integer :scope_id
      t.integer :value
      t.timestamps
    end
  end
end
