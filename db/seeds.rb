require "open-uri"

User.destroy_all
Restroom.destroy_all

User.create!(
  email: "user1@example.com",
  password: "123456",
  username: "Andi"
)

User.create!(
  email: "user2@example.com",
  password: "123456",
  username: "Oli"
)

restroom1 = Restroom.create!(
  name: "Haupti",
  address: "Europaplatz 1, 10557 Berlin",
  accessibility: true,
  baby_friendly: true,
  pricing: 1,
  longitude: 13.3695,
  latitude: 52.5250,
  user_id: User.second.id,
  approved: true
)

file1 = URI.open("https://images.unsplash.com/photo-1414452110837-9dab484a417d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2076&q=80")
restroom1.photos.attach(io: file1, filename: "#{restroom1.name.parameterize}.png", content_type: "image/png")

# https://images.unsplash.com/photo-1626039822277-0f05380ca588?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80

restroom1.save!

restroom2 = Restroom.create!(
  name: "Friedi",
  address: "Friedrichstraße 123, 10117 Berlin",
  accessibility: true,
  baby_friendly: true,
  pricing: 1,
  longitude: 13.3889,
  latitude: 52.5200,
  user_id: User.second.id,
  approved: true
)

file2 = URI.open("https://images.unsplash.com/photo-1592083646587-2c84f8e0fd2b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1674&q=80")
restroom2.photos.attach(io: file2, filename: "#{restroom2.name.parameterize}.png", content_type: "image/png")

restroom2.save!

restroom3 = Restroom.create!(
  name: "Burgi",
  address: "Potsdamer Platz 2, 10785 Berlin",
  accessibility: false,
  baby_friendly: false,
  pricing: nil,
  longitude: 13.3736,
  latitude: 52.5096,
  user_id: User.first.id,
  approved: false
)

file3 = URI.open("https://images.unsplash.com/photo-1609369069815-5b715eb143b3?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80")
restroom3.photos.attach(io: file3, filename: "#{restroom3.name.parameterize}.png", content_type: "image/png")

restroom3.save!

restroom4 = Restroom.create!(
  name: "Brandi",
  address: "Unter den Linden 77, 10117 Berlin",
  accessibility: false,
  baby_friendly: true,
  pricing: nil,
  longitude: 13.3944,
  latitude: 52.5163,
  user_id: User.second.id,
  approved: true
)

file4 = URI.open("https://plus.unsplash.com/premium_photo-1676320514140-13d16e487b02?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80")
restroom4.photos.attach(io: file4, filename: "#{restroom4.name.parameterize}.png", content_type: "image/png")

restroom4.save!


restroom5 = Restroom.create!(
  name: "Alex",
  address: "Panoramastraße 1A, 10178 Berlin",
  accessibility: false,
  baby_friendly: true,
  pricing: 1,
  longitude: 13.3695,
  latitude: 52.5250,
  user_id: User.second.id,
  approved: true
)

file5 = URI.open("https://empire-s3-production.bobvila.com/articles/wp-content/uploads/2022/03/Where-to-put-litter-box_1.jpg")
restroom5.photos.attach(io: file5, filename: "#{restroom5.name.parameterize}.png", content_type: "image/png")

restroom5.save

restroom6 = Restroom.create!(
  name: "Tim Raui",
  address: "Rudi-Dutschke-Straße 26, 10969 Berlin",
  accessibility: true,
  baby_friendly: false,
  pricing: nil,
  longitude: 13.4094,
  latitude: 52.5208,
  user_id: User.second.id,
  approved: true
)

file6 = URI.open("https://images.unsplash.com/photo-1632681179698-35ac572f6510?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80")
restroom6.photos.attach(io: file6, filename: "#{restroom6.name.parameterize}.png", content_type: "image/png")

restroom6.save!

restroom7 = Restroom.create!(
  name: "Bessi",
  address: "Besselstraße, 10969 Berlin",
  accessibility: true,
  baby_friendly: false,
  pricing: nil,
  longitude: 13.4094,
  latitude: 52.5208,
  user_id: User.first.id,
  approved: true
)

file7 = URI.open("https://forever-clean.s3.amazonaws.com/wp-content/uploads/2020/02/05105019/ForeverClean-PortableToilets2-640x540.jpg")
restroom7.photos.attach(io: file7, filename: "#{restroom7.name.parameterize}.png", content_type: "image/png")

restroom7.save!

Restroom.all.each do |restroom|
  rand(3..4).times do
    comment = Faker::Quote.yoda
    Review.create!(
      rating: rand(1..5),
      comment: comment,
      user_id: User.pluck(:id).sample,
      restroom_id: restroom.id
    )
  end
end
