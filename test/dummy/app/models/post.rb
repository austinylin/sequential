class Post < ActiveRecord::Base

  sequential scope: :author_id

end
