require 'test_helper'

class LineItemTest < ActiveSupport::TestCase
  test "an association between product and lineitem exists" do
  	lineitem = line_items(:one)
  	lineitem.product = products(:one)
  	assert lineitem.product
  end

  test "an association between product and cart exists" do
  	lineitem = line_items(:one)
  	lineitem.cart = carts(:one)
  	assert lineitem.cart
  end
end
