class PizzasController < ApplicationController

  include PizzasHelper
  def new
    @ingredients = Ingredient.all
    @sizes = Size.all
    save_cost(10)
    save_size('small')
    save_ingredients([])
  end

  def add_ingredient
    @type =  params[:type]
    current_ingredients << @type
    @pizza = create_pizza
    save_cost(get_cost(@pizza))
  end

  def remove_ingredient
    @type = params[:type]
    current_ingredients.delete(@type)
    @pizza = create_pizza
    save_cost(get_cost(@pizza))
  end

  def change_size
    @old_size = current_size
    @size = params[:size]
    save_size(@size)
    @pizza = create_pizza
    save_cost(get_cost(@pizza))
  end

end
