class Product < ActiveRecord::Base
  has_sequential_id scope: :category_id, skip: lambda { |p| p.price == -1 }
end
