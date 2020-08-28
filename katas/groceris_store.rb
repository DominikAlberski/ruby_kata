# Ever since you started work at the grocer, you have been faithfully logging
# down each item and its category that passes through. One day, your boss walks
# in and asks, "Why are we just randomly placing the items everywhere? It's too
# difficult to find anything in this place!" Now's your chance to improve the
# system, impress your boss, and get that raise!

# The input is a comma-separated list with category as the prefix in the form
# "fruit_banana". Your task is to group each item into the 4 categories Fruit,
# Meat, Other, Vegetable and output a string with a category on each line
# followed by a sorted comma-separated list of items.

# For example, given:
# "fruit_banana,vegetable_carrot,fruit_apple,canned_sardines,drink_juice,fruit_orange"

# output:
# "fruit:apple,banana,orange\nmeat:\nother:juice,sardines\nvegetable:carrot"

class Groceries
  attr_accessor :groceries_list
  def self.call(...)
    new(...).call
  end

  def initialize(groceries_list)
    self.groceries_list = groceries_list
  end

  def call
    text
  end

  private

  def categories
    {
      fruit: [],
      meat: [],
      other: [],
      vegetable: [],
    }
  end

  def parse_groceries
    groceries_list.split(',').map { |item| item.split("_") }
  end

  def segregate
    parse_groceries.each_with_object(categories) do |grocery, object|
      key = grocery[0].to_sym
      value = grocery[1]
      if categories.key?(key)
        object[key] << value
      else
        object[:other] << value
      end
    end
  end

  def sort
    segregate.each_with_object(categories) do |item, object|
      object[item.first] = item.last.sort.join(',')
    end
  end

  def text
    format(<<-TEXT, sort).delete("\s").strip
      fruit:%<fruit>s
      meat:%<meat>s
      other:%<other>s
      vegetable:%<vegetable>s
    TEXT
  end
end

# Short solution:
# def group_groceries(groceries)
#   inventory = { "fruit" => [], "meat" => [], "other" => [], "vegetable" => [] }

#   groceries.split(",").each { |str|
#     category, item = str.split("_")
#     category = "other" unless ["fruit", "meat", "vegetable"].include?(category)
#     inventory[category] << item
#   }

#   inventory.map { |k, v| "#{k}:#{v.sort.join(',')}" } .join("\n")
# end
