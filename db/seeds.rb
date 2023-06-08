require "open-uri"
Restroom.destroy_all
User.destroy_all
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# Restroom.create(name: "Public Toilet", address: "Besselstraße, 10969 Berlin",accessibility: true, hygiene_products: true, baby_friendly: false, pricing:"0,50", cleanliness: true, photo:"photo", longitude:"", latitude:"", user_id: "1")

# db/seeds.rb

5.times do
  user = User.create!(
    email: Faker::Internet.email,
    password: "123456",
    username: Faker::Name.name,
  )

  4.times do
    restroom = Restroom.create!(
      name: Faker::Company.name,
      address: Faker::Address.full_address,
      accessibility: [true, false].sample,
      hygiene_products: [true, false].sample,
      baby_friendly: [true, false].sample,
      cleanliness: Faker::Number.between(from: 1, to: 5),
      user: user
    )

      2.times do
        random_file = URI.open(Faker::LoremFlickr.image(size: "300x200", search_terms: ['restroom']))
        restroom.photos.attach( io: random_file, filename: "#{restroom}.png", content_type: "image/png")
        restroom.save!
      end
  end
end
