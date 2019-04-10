class Pantry

  attr_reader :stock

  def initialize
    @stock = Hash.new(0)
  end

  def stock_check(ingredient)
    if @stock.keys.include?(ingredient) == false
      return 0
    else
      @stock[ingredient]
    end
  end

  def restock(ingredient, quantity)
    @stock[ingredient] += quantity
  end

  def enough_ingredients_for?(recipe)
    recipe.ingredients.keys.all? do |ingredient|
      stock_check(ingredient) >= recipe.ingredients[ingredient]
    end
  end


end
