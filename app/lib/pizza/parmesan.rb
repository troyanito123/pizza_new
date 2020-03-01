module Pizza
  class Parmesan < PizzaDecorator

    COST = 6.freeze
    COST_SIZE = {small: 1, medium: 3, large: 5, extra_large: 7}.freeze
    INGREDIENT = 'parmesan '.freeze

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