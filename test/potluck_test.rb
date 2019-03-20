require 'minitest/autorun'
require 'minitest/pride'
require './lib/potluck'
require './lib/dish'

class PotluckTest < Minitest::Test
  attr_reader :potluck, :couscous_salad, :cocktail_meatballs

  def setup
    @potluck = Potluck.new('7-13-18')
    @couscous_salad = Dish.new('Couscous Salda', :appetizer)
    @cocktail_meatballs = Dish.new('Cocktail Meatballs', :entre)
  end

  def test_it_exists
    assert_instance_of Potluck, potluck
  end

  def test_has_attributes
    assert_equal '7-13-18', potluck.date
  end

  def test_it_starts_with_no_dishes
    assert_equal [], potluck.dishes
  end

  def test_it_can_hold_dishes
    potluck.add_dish(couscous_salad)
    potluck.add_dish(cocktail_meatballs)
    potluck.dishes.each do |dish|
      assert_instance_of Dish, dish
    end
    assert_equal 2, potluck.dishes.length
  end
end
