class Product < ActiveRecord::Base
  sequential scope: :category_id, skip: lambda { |p| p.price == -1 }
end
