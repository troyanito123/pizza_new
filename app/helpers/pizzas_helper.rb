module PizzasHelper

  def save_cost(cost)
    session[:cost] = cost
  end

  def save_size(size)
    session[:size] = size
  end

  def save_ingredients(ingredients)
    session[:ingredients] = ingredients
  end

  def current_cost
    @cost = session[:cost]
  end

  def current_size
    @size = session[:size]
  end

  def current_ingredients
    @ingredients = session[:ingredients]
  end

  def create_pizza
    pizza = Pizza::PizzaDefault.new
    current_ingredients.each do |ingredient|
      pwi = get_class(pizza, ingredient)
      pizza = pwi
    end
    pizza
  end

  def get_cost(pizza)
    case current_size
    when 'small'
      pizza.small
    when 'medium'
      pizza.medium
    when 'large'
      pizza.large
    when 'extra_large'
      pizza.extra_large
    end
  end

  def save_pizza_ingredient(pizza, ingredients)
    success = true
    ingredients.each do |ingredient|
      pi = PizzaIngredient.new
      pi.ingredient = Ingredient.find_by(code: ingredient)
      pi.pizza_model = pizza
      success = success && pi.save
    end
    success
  end

  private
  def get_class(pizza, ingredient)
    case ingredient
    when 'parmesan'
      Pizza::Parmesan.new pizza
    when 'mozzarella'
      Pizza::Mozzarella.new pizza
    when 'pineapple'
      Pizza::Pineapple.new pizza
    when 'mushroom'
      Pizza::Mushroom.new pizza
    end
  end

end
