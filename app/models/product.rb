class Product < ApplicationRecord
  validates :title, presence: true,
    length: { minimum: 1, maximum: 100 }
  validates :price, presence: true,
    numericality: { greater_than_or_equal_to: 0 }
  validates :description, length: { maximum: 501 }
  validates :brand, presence: true
end
