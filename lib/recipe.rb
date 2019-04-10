class Recipe

  attr_reader :name,
              :ingredients

  def initialize(name)
    @name = name
    @ingredients = Hash.new(0)

  end

  def add_ingredient(ingredient, quantity)
    @ingredients[ingredient] += quantity
  end

  def list_ingredients
    @ingredients.keys
  end

  def quantity_needed(ingredient)
    @ingredients[ingredient]
  end

  def dish_calories
    @ingredients.keys.sum do |ingredient|
      quantity_needed(ingredient) * ingredient.calories
    end
  end

end
