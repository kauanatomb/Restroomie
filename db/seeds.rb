require "open-uri"
Restroom.destroy_all
User.destroy_all

User.create!(
  email: "user1@example.com",
  password: "123456",
  username: "User 1"
)

User.create!(
  email: "user2@example.com",
  password: "123456",
  username: "User 2"
)

User.create!(
  email: "user3@example.com",
  password: "123456",
  username: "User 3"
)

Restroom.create!(
  name: "Alexanderplatz Restroom",
  address: "Alexanderplatz 1, 10178 Berlin",
  accessibility: true,
  hygiene_products: true,
  baby_friendly: false,
  pricing: 2.50,
  cleanliness: true,
  longitude: 13.4133,
  latitude: 52.5217,
  user_id: User.first.id,
  approved: true
)

Restroom.create!(
  name: "Friedrichstraße Restroom",
  address: "Friedrichstraße 123, 10117 Berlin",
  accessibility: true,
  hygiene_products: true,
  baby_friendly: true,
  pricing: 3.00,
  cleanliness: true,
  longitude: 13.3889,
  latitude: 52.5200,
  user_id: User.second.id,
  approved: true
)

Restroom.create!(
  name: "Potsdamer Platz Restroom",
  address: "Potsdamer Platz 2, 10785 Berlin",
  accessibility: false,
  hygiene_products: false,
  baby_friendly: false,
  pricing: 1.50,
  cleanliness: false,
  longitude: 13.3736,
  latitude: 52.5096,
  user_id: User.first.id,
  approved: false
)

Restroom.create!(
  name: "Unter den Linden Restroom",
  address: "Unter den Linden 77, 10117 Berlin",
  accessibility: true,
  hygiene_products: true,
  baby_friendly: true,
  pricing: 2.00,
  cleanliness: true,
  longitude: 13.3944,
  latitude: 52.5163,
  user_id: User.third.id,
  approved: true
)

Restroom.create!(
  name: "Kurfürstendamm Restroom",
  address: "Kurfürstendamm 220, 10719 Berlin",
  accessibility: true,
  hygiene_products: false,
  baby_friendly: true,
  pricing: 2.50,
  cleanliness: true,
  longitude: 13.3307,
  latitude: 52.5039,
  user_id: User.second.id,
  approved: true
)

Restroom.create!(
  name: "Schlossplatz Restroom",
  address: "Schlossplatz 5, 10178 Berlin",
  accessibility: false,
  hygiene_products: true,
  baby_friendly: false,
  pricing: 1.00,
  cleanliness: false,
  longitude: 13.4023,
  latitude: 52.5173,
  user_id: User.first.id,
  approved: true
)

Restroom.create!(
  name: "Brandenburger Tor Restroom",
  address: "Brandenburger Tor 1, 10117 Berlin",
  accessibility: true,
  hygiene_products: true,
  baby_friendly: true,
  pricing: 2.00,
  cleanliness: true,
  longitude: 13.3777,
  latitude: 52.5163,
  user_id: User.third.id,
  approved: false
)

Restroom.create!(
  name: "Museum Island Restroom",
  address: "Museum Island, 10178 Berlin",
  accessibility: true,
  hygiene_products: false,
  baby_friendly: false,
  pricing: 1.50,
  cleanliness: true,
  longitude: 13.3986,
  latitude: 52.5199,
  user_id: User.second.id,
  approved: true
)

Restroom.create!(
  name: "Gendarmenmarkt Restroom",
  address: "Gendarmenmarkt, 10117 Berlin",
  accessibility: true,
  hygiene_products: true,
  baby_friendly: true,
  pricing: 3.00,
  cleanliness: true,
  longitude: 13.3928,
  latitude: 52.5139,
  user_id: User.first.id,
  approved: true
)

Restroom.create!(
  name: "Hackescher Markt Restroom",
  address: "Hackescher Markt, 10178 Berlin",
  accessibility: false,
  hygiene_products: true,
  baby_friendly: false,
  pricing: 1.50,
  cleanliness: false,
  longitude: 13.4022,
  latitude: 52.5225,
  user_id: User.third.id,
  approved: false
)

Restroom.create!(
  name: "Checkpoint Charlie Restroom",
  address: "Friedrichstraße 43-45, 10117 Berlin",
  accessibility: true,
  hygiene_products: true,
  baby_friendly: true,
  pricing: 2.50,
  cleanliness: true,
  longitude: 13.3903,
  latitude: 52.5073,
  user_id: User.second.id,
  approved: true
)

Restroom.create!(
  name: "Tiergarten Park Restroom",
  address: "Straße des 17. Juni, 10557 Berlin",
  accessibility: true,
  hygiene_products: false,
  baby_friendly: true,
  pricing: 2.00,
  cleanliness: true,
  longitude: 13.3504,
  latitude: 52.5143,
  user_id: User.first.id,
  approved: true
)

Restroom.create!(
  name: "East Side Gallery Restroom",
  address: "Mühlenstraße 3-100, 10243 Berlin",
  accessibility: true,
  hygiene_products: true,
  baby_friendly: false,
  pricing: 1.50,
  cleanliness: false,
  longitude: 13.4415,
  latitude: 52.5054,
  user_id: User.third.id,
  approved: true
)

Restroom.create!(
  name: "Charlottenburg Palace Restroom",
  address: "Spandauer Damm 10-22, 14059 Berlin",
  accessibility: false,
  hygiene_products: true,
  baby_friendly: false,
  pricing: 1.00,
  cleanliness: true,
  longitude: 13.2957,
  latitude: 52.5209,
  user_id: User.second.id,
  approved: false
)

Restroom.create!(
  name: "Berlin Wall Memorial Restroom",
  address: "Bernauer Straße 119, 13355 Berlin",
  accessibility: true,
  hygiene_products: false,
  baby_friendly: true,
  pricing: 2.00,
  cleanliness: true,
  longitude: 13.3934,
  latitude: 52.5387,
  user_id: User.first.id,
  approved: true
)

Restroom.create!(
  name: "Berlin Cathedral Restroom",
  address: "Am Lustgarten, 10178 Berlin",
  accessibility: true,
  hygiene_products: true,
  baby_friendly: true,
  pricing: 2.50,
  cleanliness: true,
  longitude: 13.4019,
  latitude: 52.5186,
  user_id: User.third.id,
  approved: true
)

Restroom.create!(
  name: "Olympic Stadium Restroom",
  address: "Olympischer Platz 3, 14053 Berlin",
  accessibility: false,
  hygiene_products: true,
  baby_friendly: false,
  pricing: 1.50,
  cleanliness: false,
  longitude: 13.2417,
  latitude: 52.5121,
  user_id: User.second.id,
  approved: true
)

Restroom.create!(
  name: "Victory Column Restroom",
  address: "Großer Stern, 10557 Berlin",
  accessibility: true,
  hygiene_products: true,
  baby_friendly: true,
  pricing: 3.00,
  cleanliness: true,
  longitude: 13.3427,
  latitude: 52.5146,
  user_id: User.first.id,
  approved: false
)

Restroom.create!(
  name: "Berlin TV Tower Restroom",
  address: "Panoramastraße 1A, 10178 Berlin",
  accessibility: true,
  hygiene_products: false,
  baby_friendly: false,
  pricing: 2.00,
  cleanliness: true,
  longitude: 13.4094,
  latitude: 52.5208,
  user_id: User.third.id,
  approved: true
)

Restroom.create!(
  name: "Berlin Central Station Restroom",
  address: "Europaplatz 1, 10557 Berlin",
  accessibility: true,
  hygiene_products: true,
  baby_friendly: true,
  pricing: 2.50,
  cleanliness: true,
  longitude: 13.3695,
  latitude: 52.5250,
  user_id: User.second.id,
  approved: true
)


Restroom.all.each do |restroom|
  2.times do
    random_file = URI.open(Faker::LoremFlickr.image(size: "300x200", search_terms: ['restroom']))
    restroom.photos.attach(io: random_file, filename: "#{restroom.name.parameterize}.png", content_type: "image/png")
    restroom.save!
  end

  rand(3..4).times do
    Review.create!(
      rating: rand(1..5),
      comment: Faker::Lorem.paragraph,
      user_id: User.pluck(:id).sample,
      restroom_id: restroom.id
    )
  end
end
