class User < ActiveRecord::Base
  sequential column: :user_number, use_sti_base_class: true
end