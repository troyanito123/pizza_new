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
    pizza = PizzaModule::PizzaDefault.new
    current_ingredients.each do |ingredient|
      pwi = get_class(pizza, ingredient)
      pizza = pwi
    end
    pizza
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
      PizzaModule::Parmesan.new pizza
    when 'mozzarella'
      PizzaModule::Mozzarella.new pizza
    when 'pineapple'
      PizzaModule::Pineapple.new pizza
    when 'mushroom'
      PizzaModule::Mushroom.new pizza
    end
  end

end
