module Pizza
  class PizzaDefault

    attr_accessor :cost, :ingredients

    def initialize
      @cost = 10
      @ingredients = ''
    end

    def ingredients
      @ingredients
    end

    def small
      @cost + 0
    end

    def medium
      @cost + 5
    end

    def large
      @cost + 10
    end

    def extra_large
      @cost + 13
    end

  end
end