class Pizza < ApplicationRecord
  belongs_to :size
  belongs_to :user
  has_many :pizza_ingredients
  has_many :ingredients, through: :pizza_ingredients

  scope :created_after, ->(time) { where("created_at > ?", time) }
end
