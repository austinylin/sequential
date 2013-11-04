class Invoice < ActiveRecord::Base

  has_sequential_id scope: :client_id, start_at: 1000

end
