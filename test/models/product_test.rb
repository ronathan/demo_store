require 'test_helper'

class ProductTest < ActiveSupport::TestCase
	test "product title cannot be blank" do
		product = Product.new(title: "")
		assert product.invalid?
		assert product.errors[:title].any?
	end

	test "product title must be unique" do 
		product = Product.new(title: "Blackberry Z10")
		assert product.invalid?
		assert product.errors[:title].any?
	end

	test "product description cannot be blank" do
		product = Product.new(description: "")
		assert product.invalid?
		assert product.errors[:description].any?
	end

	test "price cannot be empty" do
		product = Product.new(price: "")
		assert product.invalid?
		assert product.errors[:price].any?
	end

	test "price must be a positive number greater than $0.01" do
		product = products(:one)

		product.price = -1
		assert product.invalid?
		assert_equal ["must be greater than or equal to 0.01"], product.errors[:price]

		product.price = 0
		assert product.invalid?
		assert_equal ["must be greater than or equal to 0.01"], product.errors[:price]

		product.price = 1
		assert product.valid?
	end

	# test "price cannot save a number with three decimals" do
	# 	product = products(:one)
	# 	product.price = 10.209
	# 	assert_equal 10.209, product.price
	# end
end
