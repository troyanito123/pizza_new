module Pizza
  class PizzaDecorator < SimpleDelegator
    def class
      __getobj__.class
    end
  end
end