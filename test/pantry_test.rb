require 'minitest/autorun'
require 'minitest/pride'
require './lib/ingredient'
require './lib/recipe'
require './lib/pantry'
require 'pry'

class PantryTest < Minitest::Test

  def test_pantry_exists_and_has_attributes
    pantry = Pantry.new

    expected = Pantry
    actual = pantry
    assert_instance_of expected, actual
  end

  def test_pantry_stock_starts_empty
    pantry = Pantry.new
    cheese = Ingredient.new("Cheese", "C", 50)
    mac = Ingredient.new("Macaroni", "oz", 200)
    mac_and_cheese = Recipe.new("Mac and Cheese")

    mac_and_cheese.add_ingredient(cheese, 2)
    mac_and_cheese.add_ingredient(mac, 8)

    expected = {}
    actual = pantry.stock
    assert_equal expected, actual
  end

  def test_pantry_can_check_non_exisitant_stock
    pantry = Pantry.new
    cheese = Ingredient.new("Cheese", "C", 50)
    mac = Ingredient.new("Macaroni", "oz", 200)
    mac_and_cheese = Recipe.new("Mac and Cheese")

    mac_and_cheese.add_ingredient(cheese, 2)
    mac_and_cheese.add_ingredient(mac, 8)

    pantry.stock_check(cheese)

    expected = 0
    actual = pantry.stock_check(cheese)
    assert_equal expected, actual
  end

  def test_pantry_can_check_exisitant_stock
    pantry = Pantry.new
    cheese = Ingredient.new("Cheese", "C", 50)
    mac = Ingredient.new("Macaroni", "oz", 200)
    mac_and_cheese = Recipe.new("Mac and Cheese")

    mac_and_cheese.add_ingredient(cheese, 2)
    mac_and_cheese.add_ingredient(mac, 8)

    pantry.stock_check(cheese)

    pantry.restock(cheese, 5)
    pantry.restock(cheese, 10)

    expected = 15
    actual = pantry.stock_check(cheese)
    assert_equal expected, actual
  end

  def test_pantry_evaluates_enough_ingredients
    pantry = Pantry.new
    cheese = Ingredient.new("Cheese", "C", 50)
    mac = Ingredient.new("Macaroni", "oz", 200)
    mac_and_cheese = Recipe.new("Mac and Cheese")

    mac_and_cheese.add_ingredient(cheese, 2)
    mac_and_cheese.add_ingredient(mac, 8)

    pantry.stock_check(cheese)

    pantry.restock(cheese, 5)
    pantry.restock(cheese, 10)

    expected = false
    actual = pantry.enough_ingredients_for?(mac_and_cheese)
    assert_equal expected, actual
  end

end
