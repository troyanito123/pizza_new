class PizzasController < ApplicationController

  include PizzasHelper

  def new
    @ingredients = Ingredient.all
    @sizes = Size.all
    save_cost(10)
    save_size('small')
    save_ingredients([])
  end

  def preview

  end

  def create
    pizza = PizzaModel.new(cost: current_cost)
    pizza.size = Size.find_by(code: current_size)
    # inicio transaccion
    if pizza.save
      if save_pizza_ingredient(pizza, current_ingredients)
        flash[:success] = I18n.t 'pizza.create'
        redirect_to root_path
      else
        flash[:danger] = I18n.t 'pizza.error.relation'
        redirect_to root_path
      end
    else
      flash[:danger] = I18n.t 'pizza.error.create'
      redirect_to root_path
    end
    # fin transaccion
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
