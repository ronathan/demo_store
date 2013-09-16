class Product < ActiveRecord::Base
	validates :title, :description, :price, presence: true
	validates_uniqueness_of :title
	validates :price, numericality: { greater_than_or_equal_to: 0.01 }
end
