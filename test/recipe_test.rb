require 'minitest/autorun'
require 'minitest/pride'
require './lib/ingredient'
require './lib/recipe'
require 'pry'

class RecipeTest < Minitest::Test

  def test_recipe_exists_and_has_attributes
    recipe_1 = Recipe.new("burger")

    expected = Recipe
    actual = recipe_1
    assert_instance_of expected, actual

    expected = "burger"
    actual = recipe_1.name
    assert_equal expected, actual
  end

  def test_recipe_adds_ingredients_with_quantities
    recipe_1 = Recipe.new("burger")
    ingredient_1 = Ingredient.new("pepper", "teaspoon", 50)
    ingredient_2 = Ingredient.new("beef", "lbm", 600)

    recipe_1.add_ingredient(ingredient_1, 3)
    recipe_1.add_ingredient(ingredient_2, 5)

    expected = {ingredient_1 => 3, ingredient_2 =>  5}
    actual = recipe_1.ingredients
    assert_equal expected, actual
  end

  def test_recipe_can_list_ingredients
    recipe_1 = Recipe.new("burger")
    ingredient_1 = Ingredient.new("pepper", "teaspoon", 50)
    ingredient_2 = Ingredient.new("beef", "lbm", 600)

    recipe_1.add_ingredient(ingredient_1, 3)
    recipe_1.add_ingredient(ingredient_2, 5)

    expected = [ingredient_1, ingredient_2]
    actual = recipe_1.list_ingredients
    assert_equal expected, actual
  end

  def test_recipe_checks_quantity_of_ingredient_needed_for_recipe
    recipe_1 = Recipe.new("burger")
    ingredient_1 = Ingredient.new("pepper", "teaspoon", 50)
    ingredient_2 = Ingredient.new("beef", "lbm", 600)

    recipe_1.add_ingredient(ingredient_1, 3)
    recipe_1.add_ingredient(ingredient_2, 5)

    expected = 3
    actual = recipe_1.quantity_needed(ingredient_1)
    assert_equal expected, actual
  end

  def test_recipe_finds_total_calories_for_dish
    recipe_1 = Recipe.new("burger")
    ingredient_1 = Ingredient.new("pepper", "teaspoon", 50)
    ingredient_2 = Ingredient.new("beef", "lbm", 600)

    recipe_1.add_ingredient(ingredient_1, 3)
    recipe_1.add_ingredient(ingredient_2, 5)

    expected = 3150
    actual = recipe_1.dish_calories
    assert_equal expected, actual
  end


end
