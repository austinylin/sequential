class Comment < ActiveRecord::Base
  has_sequential_id column: :absolute_number
  has_sequential_id scope: :post_id
end
