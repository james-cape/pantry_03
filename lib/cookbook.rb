class Cookbook

  attr_reader :recipes

  def initialize
    @recipes = []
  end

  def add_recipe(recipe)
    @recipes << recipe
  end

  def summary
    summary_hash = Hash.new(0)
    recipe_details = Hash.new(0)
    ingredients_hash = Hash.new(0)


    recipes.each do |recipe|

      ingredients_sorted = recipe.ingredients.sort_by {|k, v| v}
      ingredients_sorted.reverse!


      ingredients_sorted.each do |ingr|
        binding.pry
        ingredients_hash[:ingredient] = ingr.name #done
        ingredients_hash[:amount] = recipe.amount_needed_string(ingredient)
      end

      recipe_details[:ingredients] = ingredients_hash

      summary_hash[:name] = recipe.name #done
      summary_hash[:details] = recipe_details
      summary_hash[:total_calories] = recipe.dish_calories #done



    end
  end

end
