module SequentialID
  class Sequence < ActiveRecord::Base
    set_table_name :seq_id_sequences
  end
end
