class Invoice < ActiveRecord::Base

  sequential scope: :client_id, start_at: 1000

end
