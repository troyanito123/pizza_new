class PizzaIngredient < ApplicationRecord
  belongs_to :pizza_model
  belongs_to :ingredient
end
