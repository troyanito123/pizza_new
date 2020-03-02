class Pizza < ApplicationRecord
  belongs_to :size
  has_many :pizza_ingredients
  has_many :ingredients, through: :pizza_ingredients
end
