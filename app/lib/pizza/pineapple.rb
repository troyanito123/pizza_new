module Pizza
  class Pineapple < PizzaDecorator

    COST = 5.freeze
    COST_SIZE = {small: 0, medium: 4, large: 6, extra_large: 7}.freeze
    INGREDIENT = 'pineapple '.freeze

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