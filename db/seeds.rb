# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Yogurt.create([
    { flavor: 'chocolate', topping: 'caramel', quantity: 10.0},
    { flavor: 'chocolate', topping: 'lychee', quantity: 11.2},
    { flavor: 'tart', topping: 'blueberries', quantity: 9.5},
    { flavor: 'vanilla', topping: 'brownies', quantity: 6.7},
    { flavor: 'mango', topping: 'mochi', quantity: 12.0}
  ])