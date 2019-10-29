# == Schema Information
#
# Table name: products
#
#  name       :string
#  uuid       :integer
#  price      :decimal(8, 2)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test "product name must not be empty" do
    product = Product.new
    assert product.invalid?
    assert_equal product.errors[:name][0], "can't be blank"
  end

  test "product name must be unique" do
    @product = products(:one)
    # Already existing name
    product = Product.new(price: 12.99, name: 'One product')
    assert product.invalid?
    assert_equal product.errors[:name][0], "has already been taken"
  end

  test "product price must be greater than zero" do
    product = Product.new
    assert product.invalid?
    assert_equal product.errors[:price][0], "is not a number"
  end
end
