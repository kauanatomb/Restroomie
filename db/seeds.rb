# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Restroom.create(name: "Public Toilet", address: "Besselstraße, 10969 Berlin",accessibility: true, hygiene_products: true, baby_friendly: false, pricing:"0,50", cleanliness: true, photo:"photo", longitude:"", latitude:"", user_id: "1")