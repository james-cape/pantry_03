require 'minitest/autorun'
require 'minitest/pride'
require './lib/ingredient'
require 'pry'

class IngredientTest < Minitest::Test

  def test_ingredient_exists_and_has_attributes
    ingredient_1 = Ingredient.new("pepper", "teaspoon", 5)

    expected = Ingredient
    actual = ingredient_1
    assert_instance_of expected, actual

    expected = "pepper"
    actual = ingredient_1.name
    assert_equal expected, actual

    expected = "teaspoon"
    actual = ingredient_1.unit
    assert_equal expected, actual

    expected = 5
    actual = ingredient_1.calories
    assert_equal expected, actual
  end


end
