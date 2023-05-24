# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Food.new(name: "shrimp", measuremnet_unit: 1, price: 1, quantity: 1, user_id: 3).save
Food.new(name: "potato", measuremnet_unit: 1, price: 1, quantity: 1, user_id: 3).save
Food.new(name: "tomato", measuremnet_unit: 1, price: 1, quantity: 1, user_id: 4).save
