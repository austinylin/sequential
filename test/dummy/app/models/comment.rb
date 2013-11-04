class Comment < ActiveRecord::Base
  sequential column: :absolute_number
  sequential scope: :post_id
end
