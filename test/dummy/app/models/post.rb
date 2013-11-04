class Post < ActiveRecord::Base

  has_sequential_id scope: :author_id

end
