# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "\nSeeding database...\n\n"

puts '- Creating users...'
Customer.create!(
  {
    name: 'John Snow',
    address: 'Winterfell Castle, North of Westeros'
  }
)

puts '- Creating stores...'
Store.create!([
  {
    name: 'Amazon',
    address: 'Amazon.com, Inc. Customer Service PO Box 81226 Seattle, WA 98108-1226'
  },
  {
    name: 'Submarino',
    address: 'Sacadura Cabral Street, 102 - Rio de Janeiro, RJ 20081-902'
  },
  {
    name: 'eBay',
    address: '2065 Hamilton Avenue. San Jose, California 95125'
  }
])

puts '- Creating products...'
Product.create!([
  {
    name: 'Candy Is Magic: Real Ingredients, Modern Recipe',
    base_price: '52.00',
    stock: 52,
    store: Store.find_by(name: 'Amazon')
  }
])

puts "\nDone!"
