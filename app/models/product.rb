class Product < ApplicationRecord
  belongs_to :category, optional: true
  has_many :product_images
end
