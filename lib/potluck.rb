class Potluck
  attr_reader :date, :dishes
  def initialize(date)
    @date = date
    @dishes = []
  end

  def add_dish(dish)
    @dishes << dish
  end

  def get_all_from_category(category)
    @dishes.find_all{|dish| dish.category == category}
  end

  def menu
    category_arr = @dishes.map{|dish| dish.category}
    menu_hash = {}
    category_arr.uniq.each do |category|
      menu_hash[(category.to_s + 's').to_sym] = @dishes.find_all{|dish| dish.category == category}
    end
    menu_hash.each do |category, dishes|
      dishes.map! do |dish|
        dish.name
      end
      dishes.sort!
    end
    menu_hash
  end

  def ratio(category)
    num_in_cat = @dishes.count{|dish| dish.category == category}
    ((num_in_cat.to_f / @dishes.length) * 100).round(2)
  end
end
