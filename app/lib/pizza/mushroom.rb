module Pizza
  class Mushroom < PizzaDecorator

    COST = 3.freeze
    COST_SIZE = {small: 0, medium: 2, large: 4, extra_large: 5}.freeze
    INGREDIENT = 'mushroom '.freeze

    def ingredients
      super + INGREDIENT
    end

    def small
      super + COST + COST_SIZE[:small]
    end

    def medium
      super + COST + COST_SIZE[:medium]
    end

    def large
      super + COST + COST_SIZE[:large]
    end

    def extra_large
      super + COST + COST_SIZE[:extra_large]
    end

  end
end