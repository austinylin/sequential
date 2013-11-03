module SequentialId
  class Sequence < ActiveRecord::Base
    self.table_name = 'seq_id_sequences'
  end
end
