require 'minitest/autorun'
require 'minitest/pride'
require './lib/potluck'
require './lib/dish'

class PotluckTest < Minitest::Test
  attr_reader :potluck,
              :couscous_salad,
              :cocktail_meatballs,
              :summer_pizza,
              :roast_pork,
              :candy_salad

  def setup
    @potluck = Potluck.new('7-13-18')
    @couscous_salad = Dish.new('Couscous Salad', :appetizer)
    @cocktail_meatballs = Dish.new('Cocktail Meatballs', :entre)
    @summer_pizza = Dish.new("Summer Pizza", :appetizer)
    @roast_pork = Dish.new("Roast Pork", :entre)
    @candy_salad = Dish.new("Candy Salad", :dessert)
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

  def test_it_can_pull_dishes_by_category
    potluck.add_dish(couscous_salad)
    potluck.add_dish(summer_pizza)
    potluck.add_dish(roast_pork)
    potluck.add_dish(cocktail_meatballs)
    potluck.add_dish(candy_salad)

    appetizers = potluck.get_all_from_category(:appetizer)
    appetizers.each do |dish|
      assert_equal :appetizer, dish.category
    end

    assert_equal "Couscous Salad", potluck.get_all_from_category(:appetizer).first.name
  end
end
