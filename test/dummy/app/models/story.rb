class Story < ActiveRecord::Base
  has_sequential_id column: :story_number
end
