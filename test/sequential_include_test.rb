require 'test_helper'

# Test Models:
#
#   Post        - scope: :author_id
#   Invoice     - scope: :client_id, start_at: 1000
#   Product     - scope: :category_id, skip: lambda { |p| p.price == -1 }
#   Story       - column: :story_number
#   Comment     - column: :absolute_number | scope: :post_id


class SequentialIncludeTest < ActiveSupport::TestCase
  test 'basic scoped operation' do
    p = Post.create(author_id: 1)
    assert_equal 1, p.sequential_id

    p = Post.create(author_id: 1)
    assert_equal 2, p.sequential_id

    p = Post.create(author_id: 2)
    assert_equal 1, p.sequential_id
  end

  test 'start_at' do
    i = Invoice.create(client_id: 1)
    assert_equal 1000, i.sequential_id

    i = Invoice.create(client_id: 1)
    assert_equal 1001, i.sequential_id

    i = Invoice.create(client_id: 2)
    assert_equal 1000, i.sequential_id
  end

  test 'skip' do
    p = Product.create(category_id: 1)
    assert_equal 1, p.sequential_id

    p = Product.create(category_id: 1)
    assert_equal 2, p.sequential_id

    p = Product.create(category_id: 1, price: -1)
    assert_nil p.sequential_id
    sequence = Sequential::Sequence.where(
      model: 'Product', 
      scope: 'category_id', 
      scope_value: 1
    ).first.value    
    assert_equal 2, sequence

    p = Product.create(category_id: 2)
    assert_equal 1, p.sequential_id
  end

  test 'custom sequential column' do
    s = Story.create
    assert_equal 1, s.story_number

    s = Story.create
    assert_equal 2, s.story_number
  end

  test 'multiple sequential columns' do
    c = Comment.create(post_id: 1)
    assert_equal 1, c.absolute_number
    assert_equal 1, c.sequential_id

    c = Comment.create(post_id: 1)
    assert_equal 2, c.absolute_number
    assert_equal 2, c.sequential_id

    c = Comment.create(post_id: 2)
    assert_equal 3, c.absolute_number
    assert_equal 1, c.sequential_id
  end

end
